require 'json'
require 'time'

require 'streaks/stats/habit'
require 'streaks/stats/log'

module Streaks
  module Stats
    class Parser
      def initialize(filename)
        @filename = filename
      end

      def habits
        @habits ||= data['tasks'].map do |task|
          create_habit(task)
        end
      end

      private

      def data
        unless @data
          @data = JSON.parse(File.open(@filename).read)
          raise 'File must be version 2' unless @data['version'].to_i == 2
        end

        @data
      end

      def create_habit(task)
        name = task['t']
        logs = create_logs(task['log'])

        Habit.new(
          name: name,
          logs: logs
        )
      end

      def create_logs(logs)
        logs.map do |log|
          date = Time.parse(log['d'].to_s)
          completed = log['t'] == 1 || log['t'] == 2

          Log.new(
            date: date,
            completed: completed
          )
        end
      end
    end
  end
end
