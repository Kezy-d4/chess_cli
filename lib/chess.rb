# frozen_string_literal: true

# Top level namespace for the project
module Chess
  require_relative 'core_ext/object_extensions'
  require_relative 'core_ext/numeric_extensions'
  require_relative 'core_ext/hash_extensions'
  require_relative 'chess/fen_char_analyzer'
  require_relative 'chess/fen_parser'
  require_relative 'chess/square'
  require_relative 'chess/piece'
  require_relative 'chess/player'
  require_relative 'chess/coord'
  require_relative 'chess/pieces/king'
  require_relative 'chess/pieces/queen'
  require_relative 'chess/pieces/rook'
  require_relative 'chess/pieces/bishop'
  require_relative 'chess/pieces/knight'
  require_relative 'chess/pieces/pawn'
  require_relative 'chess/pieces'
  require_relative 'chess/board'
  require_relative 'chess/aux_pos_data'
  require_relative 'chess/position'
  require_relative 'chess/display'
  require_relative 'chess/log'

  DEFAULT_FEN = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'

  BOARD_FILE_MARKERS = ('a'..'h').to_a.freeze

  BOARD_RANK_MARKERS = (1..8).to_a.reverse.freeze

  FEN_CHARS = {
    white: {
      king: 'K',
      queen: 'Q',
      rook: 'R',
      bishop: 'B',
      knight: 'N',
      pawn: 'P'
    },
    black: {
      king: 'k',
      queen: 'q',
      rook: 'r',
      bishop: 'b',
      knight: 'n',
      pawn: 'p'
    }
  }.freeze

  COORD_METHOD_MAP = {
    north: :to_northern_adjacencies,
    east: :to_eastern_adjacencies,
    south: :to_southern_adjacencies,
    west: :to_western_adjacencies,
    north_east: :to_north_eastern_adjacencies,
    south_east: :to_south_eastern_adjacencies,
    south_west: :to_south_western_adjacencies,
    north_west: :to_north_western_adjacencies
  }.freeze

  WHITE_PAWN_HOME_RANK = 2

  WHITE_PAWN_LAST_RANK = 8

  BLACK_PAWN_HOME_RANK = 7

  BLACK_PAWN_LAST_RANK = 1

  WHITE_EN_PASSANT_RANK = 3

  BLACK_EN_PASSANT_RANK = 6

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

  FEN_CHAR_PIECE_MAP = {
    white: {
      'K' => King,
      'Q' => Queen,
      'R' => Rook,
      'B' => Bishop,
      'N' => Knight,
      'P' => Pawn
    },
    black: {
      'k' => King,
      'q' => Queen,
      'r' => Rook,
      'b' => Bishop,
      'n' => Knight,
      'p' => Pawn
    }
  }.freeze

  PIECE_FEN_CHAR_MAP = {
    white: {
      King => 'K',
      Queen => 'Q',
      Rook => 'R',
      Bishop => 'B',
      Knight => 'N',
      Pawn => 'P'
    },
    black: {
      King => 'k',
      Queen => 'q',
      Rook => 'r',
      Bishop => 'b',
      Knight => 'n',
      Pawn => 'p'
    }
  }.freeze
end
