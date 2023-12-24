# require "benchmark"
require "./performance"

class Decode
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
  def self.call(string)
    ints = []
    STRING_NUMS.each do |k, v|
      string.gsub!(k.to_s) {|s| s[0] + v + s[-1]}
    end
    string.chars.each do |c|
      ints << c if c.is_integer?
    end
    (ints.first + ints.last).to_i
  end
end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

begin
  ans = 0
  File.readlines("1/input.txt").each do |line|
    ans += Decode.call(line)
  end
  puts "Answer: #{ans}"

  ## Benchmarking
  puts "="*5
  puts "Benchmarking:"
  puts "="*5
  method = Proc.new do
    ans = 0
    File.readlines("1/input.txt").each do |line|
      ans += Decode.call(line)
    end
    ans
  end
  puts Performance.measure(method)
end
