# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

module Chess
  # A mixin to analyze the characters within the piece placement data field of a
  # chess FEN record
  module FENCharAnalyzer
    def char_represents_white_piece?(char)
      Chess::FEN_CHARS[:white].value?(char)
    end

    def char_represents_black_piece?(char)
      Chess::FEN_CHARS[:black].value?(char)
    end

    def char_represents_piece?(char)
      char_represents_white_piece?(char) || char_represents_black_piece?(char)
    end

    def char_represents_contiguous_empty_squares?(char)
      char.to_i.positive?
    end
  end
end
