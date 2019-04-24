# def puts *args
#   File.open('test_out.txt','w'){|f| f.print(args)}
#   puts *args
# end
$puts = true

#!/bin/ruby

class MinHeap

  def initialize
    @heap = []
  end

  def list
    @heap
  end

  def add itm
    # p @heap
    @heap << itm
    arrange_heap!
    p @heap
  end

  private
  def arrange_heap!
    last = @heap.length - 1
    up_check last
  end

  def up_check child
    # get_parent=-> i { i == 0 ? i : (i-1)/2 }
    get_parent=-> i { (i-1)/2 }
    get_left=-> i { (i*2)+1 }
    get_right=-> i { (i*2)+2 }

    begin
    parent = get_parent[child]
    puts "#{child} #{parent} - #{@heap[child]} vs #{@heap[parent]}"
    return if parent < 0
    if @heap[child] < @heap[parent]
      swap child, parent
      up_check parent
    elsif child != 0 # for the first element
      # down_check parent
    end
    rescue Exception => e
      e
    end

  end

  def swap child, parent
  # def bubble_up child, parent
    @heap[child], @heap[parent] = @heap[parent], @heap[child]
  end

  def bubble_down child, parent
    bubble_up parent, child
  end

end

HEAP = MinHeap.new

n = gets.strip.to_i
a = Array.new(n)
get_median=-> ary, len { len.even? ? (ary[len/2]+ary[(len-2)/2])/2.0 : ary[((len-1)/2)] }

for a_i in (0..n-1)
  HEAP.add gets.strip.to_i
  # p HEAP.list
  puts get_median[HEAP.list, a_i+1].to_f
end

for a_i in (0..n-1)
  # p HEAP.list
  puts get_median[HEAP.list, a_i+1].to_f
end
