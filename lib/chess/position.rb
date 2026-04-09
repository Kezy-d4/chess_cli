# frozen_string_literal: true

module Chess
  # A chess position
  class Position
    attr_reader :board, :aux_pos_data

    using HashExtensions

    # @param board [Board]
    # @param aux_pos_data [AuxPosData]
    def initialize(board, aux_pos_data)
      @board = board
      @aux_pos_data = aux_pos_data
    end

    class << self
      # @param fen_parser [FENParser]
      def from_fen_parser(fen_parser)
        board = Board.from_fen_parser(fen_parser)
        aux_pos_data = AuxPosData.from_fen_parser(fen_parser)
        new(board, aux_pos_data)
      end
    end

    def check?
      to_attacked_destinations_by(to_inactive_color).include?(to_king_source(to_active_color))
    end

    # This method returns a complete array of attacked destinations from a given
    # source, including legal en passant destinations. An attacked destination
    # is one that a piece can move to while capturing an enemy piece.
    # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    def to_attacked_destinations_from(source)
      return [] unless @board.occupied_at?(source)

      piece = @board.occupant_at(source)
      piece.to_adjacent_capture_coords(source).transform_values { |adjacent_coord_a|
        if SpecialMoveAnalyzer.new(self).en_passant_attack?(source, adjacent_coord_a.first)
          adjacent_coord_a.first
        else
          adjacent_coord_a.find do |adjacent_coord|
            next if @board.vacant_at?(adjacent_coord)
            break if @board.occupant_at(adjacent_coord).friendly_with?(piece)

            @board.occupant_at(adjacent_coord).enemy_to?(piece)
          end
        end
      }.wrap_vals_in_arr.delete_empty_arr_vals.values.flatten
    end
    # rubocop: enable all

    # This method returns a complete array of controlled destinations from a
    # given source, including legal castle destinations. A controlled destination
    # is one that a piece can move to without capturing an enemy piece.
    def to_controlled_destinations_from(source)
      (to_partial_controlled_destinations_from(source) <<
        SpecialMoveAnalyzer.new(self).to_legal_castle_destinations_from(source)).flatten
    end

    def to_attacked_destinations_by(color)
      to_all_sources(color).map { |source|
        to_attacked_destinations_from(source)
      }.flatten.uniq
    end

    def to_controlled_destinations_by(color)
      to_all_sources(color).map { |source|
        to_controlled_destinations_from(source)
      }.flatten.uniq
    end

    def to_active_color
      if @aux_pos_data.white_has_the_move?
        :white
      elsif @aux_pos_data.black_has_the_move?
        :black
      end
    end

    def to_inactive_color
      if @aux_pos_data.white_has_the_move?
        :black
      elsif @aux_pos_data.black_has_the_move?
        :white
      end
    end

    def to_king_source(color)
      to_all_sources(color).find { |coord| @board.occupant_at(coord).is_a?(King) }
    end

    def to_all_sources(color)
      @board.to_occupied_locations(color).keys
    end

    def all_sources_vacant?(sources)
      sources.all? { |source| @board.vacant_at?(source) }
    end

    # This method uses #to_partial_controlled_destinations_by to avoid infinite
    # loops related to the castling logic in SpecialMoveAnalyzer.
    def all_sources_free_from_enemy_control?(sources, color)
      sources.all? do |source|
        if color == :white
          !to_partial_controlled_destinations_by(:black).include?(source)
        elsif color == :black
          !to_partial_controlled_destinations_by(:white).include?(source)
        end
      end
    end

    def to_fen
      "#{@board.to_partial_fen} #{@aux_pos_data.to_partial_fen}"
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end

    private

    # This method returns a partial array of controlled destinations from a
    # given source. A controlled destination is one that a piece can move to
    # without capturing an enemy piece. The array is partial in the sense that
    # it does not include any potential castling destinations. Public method
    # #to_controlled_destinations_from returns the complete array and should
    # always be called instead. It is necessary to separate the algorithm in
    # this way to avoid infinite loops related to the castling logic in
    # SpecialMoveAnalyzer.
    def to_partial_controlled_destinations_from(source)
      return [] unless @board.occupied_at?(source)

      piece = @board.occupant_at(source)
      piece.to_adjacent_movement_coords(source).transform_values { |adjacent_coord_a|
        adjacent_coord_a.take_while do |adjacent_coord|
          @board.vacant_at?(adjacent_coord)
        end
      }.delete_empty_arr_vals.values.flatten
    end

    def to_partial_controlled_destinations_by(color)
      to_all_sources(color).map { |source|
        to_partial_controlled_destinations_from(source)
      }.flatten.uniq
    end
  end
end
