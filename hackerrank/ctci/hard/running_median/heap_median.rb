# def puts *args
#   File.open('test_out.txt','w'){|f| f.print(args)}
#   puts *args
# end

#!/bin/ruby

class MinHeap
  def initialize

  end

  get_parent=-> i { (i-1)/2 }
  get_left=-> i { (i*2)+1 }
  get_right=-> i { (i*2)+2 }

  def add itm
Array
  end

  private
  def arrange_heap

  end

  def bubble_up

  end

  def bubble_down

  end

end

HEAP = MinHeap.new

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
  a[a_i] = gets.strip.to_i
  get_median=-> ary { len = ary.length; len.even?? (ary[len/2]+ary[(len-2)/2])/2.0 : ary[((len-1)/2)]}
  puts get_median[a[0..a_i]].to_f
end

