# frozen_string_literal: true

module Chess
  # Logs data about a chess game
  class Log
    attr_reader :metadata, :fen_history

    # @param metadata [Hash{Symbol => Coord}]
    # @param fen_history [Array<String>]
    def initialize(metadata = {}, fen_history = [])
      @metadata = metadata
      @fen_history = fen_history
    end
  end
end
