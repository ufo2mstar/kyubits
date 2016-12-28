# def puts *args
#   File.open('test_out.txt','w'){|f| f.print(args)}
#   puts *args
# end
$puts = true

#!/bin/ruby

class Heap

  def initialize type
    @heap = []
    @min_or_max = type
  end

  def show
    [@lowers,@highers]
  end

  def add itm
    @lowers.add itm if @lowers

  end

  private
  def arrange_heap!
    last = @heap.length - 1
    heapify last if last > 0
  end

  def sort_heap!
# dangit.. not needed for this problem
  end

  def get_parent i
    (i-1)/2
    i == 0 ? i : (i-1)/2
  end

  def get_left i
    (i*2)+1
  end

  def get_right i
    (i*2)+2
  end

  def heapify child
    # get_parent=-> i { i == 0 ? i : (i-1)/2 }

    begin
      parent = get_parent(child)
      puts "#{child} #{parent} - #{@heap[child]} vs #{@heap[parent]}" if $puts
      return if parent < 0
      if @heap[child] < @heap[parent]
        swap child, parent
        heapify parent
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

@lows = Heap.new 'min'
@highs = Heap.new 'max'

n = gets.strip.to_i
a = Array.new(n)
get_median=-> ary, len { len.even? ? (ary[len/2]+ary[(len-2)/2])/2.0 : ary[((len-1)/2)] }

for a_i in (0..n-1)
  HEAP.add a_i, gets.strip.to_i
  # p HEAP.list
  puts get_median[HEAP.list, a_i+1].to_f
end

