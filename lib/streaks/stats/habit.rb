require 'json'

module Streaks
  module Stats
    class Habit
      attr_reader :name, :logs

      def initialize(name:, logs:)
        @name = name
        @logs = logs
      end

      def monthly_stats
        results = {}
        @logs.each do |log|
          key = log.date.strftime('%Y-%m')
          results[key] ||= 0
          results[key] += 1 if log.completed
        end
        results
      end
    end
  end
end
