# frozen_string_literal: true

Dir[File.expand_path("lib/**/day/**/*.rb")].each { |file| require file }

class Aoc23
  class << self
    def print_answers
      (1..last_completed_day).map { |i| format("%02d", i) }.each do |day|
        puts("Day " + day.to_i.to_s)
        puts(Module.const_get("Day#{day}").call)
        puts("=" * 10)
      end
    end

    private

    def last_completed_day
      # lol this is inefficient
      Dir[File.expand_path("lib/**/day/**/")].map { |path| path[-2, 2] }.last.to_i
    end
  end
end

Aoc23.print_answers
