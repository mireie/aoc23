# frozen_string_literal: true

class Day01
  STRING_NUMS = {
    "one": "1",
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
  }

  class << self
    def call
      ans = 0
      File.readlines(__dir__ + "/input.txt").each do |line|
        ans += calibrate_line(line)
      end
      ans
    end

    def calibrate_line(line)
      ints = []
      STRING_NUMS.each do |k, v|
        line.gsub!(k.to_s) { |s| s[0] + v + s[-1] }
      end
      line.chars.each do |c|
        ints << c if c.to_i.to_s == c
      end
      (ints.first + ints.last).to_i
    end
  end
end
