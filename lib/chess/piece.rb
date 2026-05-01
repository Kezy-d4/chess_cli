# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

module Chess
  # A superclass to each of the chess pieces
  class Piece
    attr_reader :color

    using ObjectExtensions

    # @param color [Symbol]
    def initialize(color)
      @color = color
    end

    def white?
      @color == :white
    end

    def black?
      @color == :black
    end

    def friendly_with?(other)
      @color == other.color
    end

    def enemy_to?(other)
      @color != other.color
    end

    def to_s
      "The #{to_class_s} is #{@color}."
    end
  end
end
