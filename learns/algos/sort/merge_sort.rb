
tots = 10000
max = 1000000

def rand_array(x, max)
  x.times.map {Random.rand(max)}
end


class Array
  def merge_sort

  end
end

require "benchmark"

Benchmark.bm(7) do |x|
  srand 12345
  x.report("quick:") {
    (1..100).each {|i|
      ary = rand_array(tots, max)
      a = ary.dup
      a.sort
    }
  }
  srand 12345
  x.report("merge:") {
    (1..100).each {|i|
      ary = rand_array(tots, max)
      a = ary.dup
      a.sort
    }
  }
end
