# frozen_string_literal: true

module Chess
  # A chess position
  class Position
    attr_reader :board, :aux_pos_data

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

    def to_fen
      "#{@board.to_partial_fen} #{@aux_pos_data.to_partial_fen}"
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end
  end
end
