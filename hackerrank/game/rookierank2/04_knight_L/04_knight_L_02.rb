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
  end

  def run
    compute
    disp
  end

  def check a,b
    ary = [a,b]
    bfs(ary)
  end

  def kni_l a, b, n, x, y
    #todo: rethink non hard coded logic
    # xx=[x-a, x+a, x-b, x+b]
    # yy=[y-a, y+a, y-b, y+b]
    # xx = [a,b]
    # yy = [x,y]
    ## aah = [+,-] #that's where it was!
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
    inp = [
        [x+a, y+b],
        [x+a, y-b],
        [x-a, y+b],
        [x-a, y+b],
        [x+b, y+a],
        [x+b, y-a],
        [x-b, y+a],
        [x-b, y-a],
    ]
    res = []
    inp.each { |ary| i, j = ary; res << ary unless i >= n or i < 0 or j >= n or j < 0 }
    res
  end

  def disp
    (1...@n).each do |i|
      res = []
      (1...@n).each do |j|
        ary = [i, j].sort
        res << @board[ary]
      end
      puts res.join(' ')
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

  # def bfs ary
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
n = 11
k = KnightL.new n
# k.run

k.check 1,6
