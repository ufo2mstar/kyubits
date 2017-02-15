require 'set'

class Queue
  def initialize que = nil
    @que = que || []
  end

  def enq obj
    @que << obj
  end

  def deq
    @que.shift
  end

  def dup
    Queue.new(@que)
  end

  def clear
    @que = []
  end

  def empty?
    @que.size == 0
  end
end

class KnightL
  def initialize n
    @n = n
    @board = {}
    # compute
    # disp
  end

  def kni_l a, b, n, x, y
    xx=[x-a, x+a, x-b, x+b]
    yy=[y-a, y+a, y-b, y+b]
    # res = []
    # xx.each do |i|
    #   unless i >= n or i < 0
    #     yy.each do |j|
    #       unless j >= n or j < 0
    #         res << [i, j]
    #       end
    #     end
    #   end
    # end
    # res
  end

  def disp
    @n.times do |i|
      @n.times do |j|
        ary = [i, j].sort
        print "#{@board[ary]} "
        # p ary
      end
      puts
    end
  end

  def compute
    (1..@n).each do |i|
      (i...@n).each do |j|
        ary = [i, j]
        @board[ary] = bfs(ary)
      end
    end
  end

  def bfs ary
    a, b = ary
    visited = Set.new
    currQ = Queue.new

    currQ.enq [0, 0]
    e = @n-1; dest = [e, e]

    r = 0
    until currQ.empty?
      nextQ = currQ.dup
      currQ.clear
      until nextQ.empty?
        curr = nextQ.deq
        if curr == dest
          return r
        else
          visited << curr
          nxt_ary = kni_l(a, b, @n, *curr)
          nxt_ary.each do |nxt|
            unless visited.include? nxt
              visited << nxt
              currQ.enq nxt
            end
          end
        end
      end
      nextQ.clear
      r+=1
    end
    -1
  end

end

# n = gets.chomp.to_i
n = 5
k = KnightL.new n

x, y, a, b = 0, 0, 1, 4
k.kni_l a, b, n, x, y