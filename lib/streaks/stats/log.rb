require 'json'

module Streaks
  module Stats
    class Log
      attr_reader :date, :completed

      def initialize(date:, completed:)
        @date = date
        @completed = completed
      end
    end
  end
end
