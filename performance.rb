require "benchmark"
class Performance
  def self.measure(method)
    Benchmark.bmbm do |x|
      x.report do
        method.call
      end
    end
  end
end