# frozen_string_literal: true

module Chess
  # A namespace to store king and castling related constants
  module KingAndCastlingConstants
    WHITE_KING_HOME_COORD = Coord.from_s('e1')

    BLACK_KING_HOME_COORD = Coord.from_s('e8')

    WHITE_KINGSIDE_ROOK_HOME_COORD = Coord.from_s('h1')

    WHITE_QUEENSIDE_ROOK_HOME_COORD = Coord.from_s('a1')

    BLACK_KINGSIDE_ROOK_HOME_COORD = Coord.from_s('h8')

    BLACK_QUEENSIDE_ROOK_HOME_COORD = Coord.from_s('a8')

    WHITE_KINGSIDE_ROOK_CASTLE_PATH = [Coord.from_s('f1')].freeze

    WHITE_QUEENSIDE_ROOK_CASTLE_PATH = [Coord.from_s('d1')].freeze

    BLACK_KINGSIDE_ROOK_CASTLE_PATH = [Coord.from_s('f8')].freeze

    BLACK_QUEENSIDE_ROOK_CASTLE_PATH = [Coord.from_s('d8')].freeze

    WHITE_KINGSIDE_CASTLE_PATH = [Coord.from_s('e1'), Coord.from_s('f1'), Coord.from_s('g1')].freeze

    WHITE_QUEENSIDE_CASTLE_PATH = [Coord.from_s('e1'), Coord.from_s('d1'), Coord.from_s('c1')].freeze

    BLACK_KINGSIDE_CASTLE_PATH = [Coord.from_s('e8'), Coord.from_s('f8'), Coord.from_s('g8')].freeze

    BLACK_QUEENSIDE_CASTLE_PATH = [Coord.from_s('e8'), Coord.from_s('d8'), Coord.from_s('c8')].freeze
  end
end
