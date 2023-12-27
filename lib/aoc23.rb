# frozen_string_literal: true

Dir[File.expand_path("lib/**/day/**/*.rb")].each { |file| require file }

class Aoc23
  class << self
    def print_answers
      puts("Day 1: ")
      puts(Day01.call)
    end
  end
end

Aoc23.print_answers
