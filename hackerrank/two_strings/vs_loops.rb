require 'benchmark'
file = Dir['C:/All_my_tests/07-27-2015/*.html'][0]
# file = 'C:/All_my_tests/07-27-2015/ARunemp.html'
m=10000
k=0
5.times do
  Benchmark.bm do |bm|

    bm.report(" for  :") do
# for-loop method
      for n in 0..m
        k+=n
      end
    end
    bm.report(" times:") do
# times method
      m.times do |n|
        k+=n
      end
    end
    bm.report(" range:") do
# range method
      (0..m).each do |n|
        k+=n
      end
    end
    bm.report(" upto :") do
# upto method
      0.upto(m) do |n|
        k+=n
      end
    end


  end
end


