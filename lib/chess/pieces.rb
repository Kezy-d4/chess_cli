# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

module Chess
  # A mixin to construct chess pieces from their corresponding FEN character and
  # convert existing pieces into said character
  module Pieces
    include FENCharAnalyzer

    def construct_piece_from_char(char)
      if char_represents_white_piece?(char)
        Chess::FEN_CHAR_PIECE_MAP[:white][char].new(:white)
      elsif char_represents_black_piece?(char)
        Chess::FEN_CHAR_PIECE_MAP[:black][char].new(:black)
      end
    end

    def convert_piece_to_char(piece)
      if piece.white?
        Chess::PIECE_FEN_CHAR_MAP[:white][piece.class]
      elsif piece.black?
        Chess::PIECE_FEN_CHAR_MAP[:black][piece.class]
      end
    end
  end
end
