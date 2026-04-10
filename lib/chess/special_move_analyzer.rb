# frozen_string_literal: true

module Chess
  # Analyzes special moves such as castling, en passant capture and promotion in
  # the context of a chess position
  class SpecialMoveAnalyzer # rubocop:disable Metrics/ClassLength
    # @param position [Position]
    def initialize(position)
      @position = position
    end

    def to_legal_en_passant_destinations_from(source)
      return [] unless @position.board.occupant_at(source).is_a?(Pawn)

      pawn = @position.board.occupant_at(source)
      pawn.to_potential_en_passant_capture_coords(source).select do |capture_coord|
        capture_coord == Coord.from_s(@position.aux_pos_data.access_en_passant_target)
      end
    end

    def en_passant_attack?(source, destination)
      @position.board.pawn_at?(source) &&
        destination.to_s == @position.aux_pos_data.access_en_passant_target
    end

    def to_en_passant_capture_coord
      return '-' unless @position.aux_pos_data.en_passant_target_available?

      target = Coord.from_s(@position.aux_pos_data.access_en_passant_target)
      if target.rank == Chess::WHITE_EN_PASSANT_VULNERABLE_RANK
        target.to_adjacency(0, 1)
      elsif target.rank == Chess::BLACK_EN_PASSANT_VULNERABLE_RANK
        target.to_adjacency(0, -1)
      end
    end

    def move_to_promote?(source, destination)
      return false unless @position.board.pawn_at?(source)

      pawn = @position.board.occupant_at(source)
      if pawn.white?
        destination == Chess::WHITE_PAWN_LAST_RANK
      elsif pawn.black?
        destination == Chess::BLACK_PAWN_LAST_RANK
      end
    end

    def to_legal_castle_destinations_from(source)
      return [] unless @position.board.occupant_at(source).is_a?(King)

      king = @position.board.occupant_at(source)
      if king.white?
        to_legal_white_castle_destinations
      elsif king.black?
        to_legal_black_castle_destinations
      end
    end

    def kingside_castle_legal?(color)
      kingside_castle_rights_available?(color) &&
        kingside_castle_space_clear?(color) &&
        kingside_castle_path_free_from_enemy_control?(color)
    end

    def queenside_castle_legal?(color)
      queenside_castle_rights_available?(color) &&
        queenside_castle_space_clear?(color) &&
        queenside_castle_path_free_from_enemy_control?(color)
    end

    private

    def to_legal_white_castle_destinations
      arr = []
      arr << Chess::WHITE_KINGSIDE_CASTLE_PATH.last if kingside_castle_legal?(:white)
      arr << Chess::WHITE_QUEENSIDE_CASTLE_PATH.last if queenside_castle_legal?(:white)
      arr
    end

    def to_legal_black_castle_destinations
      arr = []
      arr << Chess::BLACK_KINGSIDE_CASTLE_PATH.last if kingside_castle_legal?(:black)
      arr << Chess::BLACK_QUEENSIDE_CASTLE_PATH.last if queenside_castle_legal?(:black)
      arr
    end

    def kingside_castle_path_free_from_enemy_control?(color)
      if color == :white
        @position.all_sources_free_from_enemy_control?(Chess::WHITE_KINGSIDE_CASTLE_PATH[1..], color) &&
          @position.all_sources_free_from_enemy_attack?([Chess::WHITE_KINGSIDE_CASTLE_PATH.first], color)
      elsif color == :black
        @position.all_sources_free_from_enemy_control?(Chess::BLACK_KINGSIDE_CASTLE_PATH[1..], color) &&
          @position.all_sources_free_from_enemy_attack?(Chess::BLACK_KINGSIDE_CASTLE_PATH.first, color)
      end
    end

    def queenside_castle_path_free_from_enemy_control?(color)
      if color == :white
        @position.all_sources_free_from_enemy_control?(Chess::WHITE_QUEENSIDE_CASTLE_PATH[1..], color) &&
          @position.all_sources_free_from_enemy_attack?([Chess::WHITE_QUEENSIDE_CASTLE_PATH.first], color)
      elsif color == :black
        @position.all_sources_free_from_enemy_control?(Chess::BLACK_QUEENSIDE_CASTLE_PATH[1..], color) &&
          @position.all_sources_free_from_enemy_attack?([Chess::BLACK_QUEENSIDE_CASTLE_PATH.first], color)
      end
    end

    def kingside_castle_rights_available?(color)
      if color == :white
        @position.aux_pos_data.white_kingside_castle_available?
      elsif color == :black
        @position.aux_pos_data.black_kingside_castle_available?
      end
    end

    def queenside_castle_rights_available?(color)
      if color == :white
        @position.aux_pos_data.white_queenside_castle_available?
      elsif color == :black
        @position.aux_pos_data.black_queenside_castle_available?
      end
    end

    def kingside_castle_space_clear?(color)
      if color == :white
        @position.all_sources_vacant?(Chess::WHITE_KINGSIDE_CASTLE_SPACE)
      elsif color == :black
        @position.all_sources_vacant?(Chess::BLACK_KINGSIDE_CASTLE_SPACE)
      end
    end

    def queenside_castle_space_clear?(color)
      if color == :white
        @position.all_sources_vacant?(Chess::WHITE_QUEENSIDE_CASTLE_SPACE)
      elsif color == :black
        @position.all_sources_vacant?(Chess::BLACK_QUEENSIDE_CASTLE_SPACE)
      end
    end
  end
end
