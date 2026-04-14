# frozen_string_literal: true

module Chess
  # Processes a turn in the context of a chess position
  class TurnProcessor
    def self.play_turn(...)
      new(...).play_turn
    end

    # @param position [Position]
    # @param log [Log]
    # @param source [Coord] the legal source
    # @param destination [Coord] the legal destination
    def initialize(...)
      @position = position
      @log = log
      @source = source
      @destination = destination
    end

    def play_turn
      log_fen if @log.fen_history.empty?
      move
      swap_colors
      log_fen
    end

    private

    def move
      update_metadata_before_move
      update_half_move_clock_before_move
      update_castling_rights_before_move
      handle_castling_before_move
      @position.move_piece(@source, @destination)
      update_en_passant_target_after_move
      handle_promotion_after_move
    end

    def swap_colors
      update_full_move_number_before_color_swap
      swap_active_color
      update_metadata_after_move
    end

    def update_metadata_before_move
      @log.metadata[:previous_source] = @source
      @log.metadata[:previous_destination] = @destination
    end

    def update_half_move_clock_before_move
      # if pawn would move or move would capture
      #   reset half move clock
      # else
      #   increment half move clock
    end

    def update_castling_rights_before_move
      # if move to castle
      #   remove all castling rights for the appropriate color
      # elsif rook would move from home
      #   remove castling rights for the appropriate color and side
    end

    def handle_castling_before_move
      # if move to castle
      #   move the appropriate rook to the appropriate destination
    end

    def update_en_passant_target_after_move
      # if previous move was a double pawn push
      #   update the en passant target based on the color of the pawn
      # else
      #   reset the en passant target
    end

    def handle_promotion_after_move
      # if moved to promote
      #   promote the pawn
    end

    def update_full_move_number_before_color_swap
      @position.aux_pos_data.increment_full_move_number if @position.to_active_color == :black
    end

    def swap_active_color
      @position.aux_pos_data.swap_active_color
    end

    def update_metadata_after_move
      @log.metadata[:checked_king] =
        @position.check? ? @position.to_king_source(@position.to_active_color) : nil
    end

    def log_fen
      @log.fen_history << @position.to_fen
    end
  end
end
