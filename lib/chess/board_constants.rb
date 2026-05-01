# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

module Chess
  # A namespace to store board related constants
  module BoardConstants
    BOARD_FILE_MARKERS = ('a'..'h').to_a.freeze
    BOARD_RANK_MARKERS = (1..8).to_a.reverse.freeze
  end
end
