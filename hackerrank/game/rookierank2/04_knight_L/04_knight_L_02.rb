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
    @print = false
    compute
    disp
    @print = true
  end

  def check a, b
    @print = true
    ary = [a, b]
    p bfs(ary)
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
    # a,b=a-1,b-1
    # x,y=x-1,y-1
    inp = [
        [x+a, y+b],
        [x+a, y-b],
        [x-a, y+b],
        [x-a, y-b], # FML
        [x+b, y+a],
        [x+b, y-a],
        [x-b, y+a],
        [x-b, y-a],
    ]
    res = []
    inp.each { |ary| i, j = ary; res << ary unless i >= n or i < 0 or j >= n or j < 0 }
    # inp.each { |ary| i, j = ary; res << ary unless i > n or i < 0 or j > n or j < 0 }
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

  def show_board b
    if @print
      (0...@n).each do |i|
        res = []
        (0...@n).each do |j|
          ary = [i, j]
          res << (b[ary] || '-')
        end
        puts res.join("\t")
      end
      puts "-"*100
    end
  end

  def show_history h, b, d
    prev = h[d]
    board = {}
    # board[[0, 0]]=0
    loop do
      board[d] = b[d]
      d = prev
      prev = h[d]
      break if prev.nil?
    end
    show_board board
  end

  def bfs ary
    a, b = ary
    board = {}
    history = {}
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
        board[curr] = r
        if curr == dest
          show_board board
          show_history history, board, dest
          return r
        else
          visited << curr
          nxt_ary = kni_l(a, b, @n, *curr)
          nxt_ary.each do |nxt|
            unless visited.include? nxt
              history[nxt] = curr
              currQ.enq nxt
            end
          end
        end
      end
      show_board board
      nextQ.clear
      r+=1
    end
    show_board board
    -1
  end

end

# n = gets.chomp.to_i
n,a,b = 11,1,6
n,a,b = 11,2,9
# n,a,b = 21,5,4

k = KnightL.new n
# k.run
k.check a,b
