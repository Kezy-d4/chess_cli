# Chess CLI  Copyright (C) 2026  Kezy-d4
# This software is licensed under the GNU GPLv3.
# See the full license: https://www.gnu.org/licenses/gpl-3.0.en.html

# frozen_string_literal: true

module Chess
  # A chess player
  class Player
    attr_reader :name, :color

    # @param name [String]
    # @param color [Symbol]
    def initialize(name, color)
      @name = name
      @color = color
    end

    def white?
      @color == :white
    end

    def black?
      @color == :black
    end

    def to_s
      "#{@name}(#{@color})"
    end
  end
end
