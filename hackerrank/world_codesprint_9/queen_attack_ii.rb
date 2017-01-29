# require 'matrix'

class PretMatrix
  def self.build n,r,c,b
    res = {}
    bounds = []
    res[a] = b
  end

  def sum
    self.to_a.flatten.reduce(&:+)
  end

  def []=(i, j, x)
    @rows[i][j] = x
  end

  def show
    # puts self.to_a.map{|b| print b}
    self.to_a.map { |b| print "#{b.join " "}\n" }
    puts
  end
end

n, k = gets.strip.split(' ')
n = n.to_i
k = k.to_i

class Board
  def initialize n, r_q, c_q
    @lim = n
    @block = 'x'
    @r_q, @c_q = r_q-1, c_q-1
    # @r_q, @c_q = r_q, c_q
    @board = make_board @lim
    obst(@r_q+1, @c_q+1, 9)
  end

  def make_board n
    # PretMatrix.build(n,@r_q,@c_q)
    {}
  end

  def obst(rO, cO, val=@block)
    @board[[rO-1, cO-1]] = val
  end
  #
  # def count
  #   @res = 0
  #   low_row = (0...@r_q).to_a.reverse
  #   hi_row = (@r_q+1...@lim).to_a
  #   low_col = (0...@c_q).to_a.reverse
  #   hi_col = (@c_q+1...@lim).to_a
  #   lcs, hcs, lrs, hrs = low_col.size, hi_col.size, low_row.size, hi_row.size
  #
  #   run([@r_q]*lcs, low_col)
  #   run([@r_q]*hcs, hi_col)
  #   run(low_row, [@c_q]*lrs)
  #   run(hi_row, [@c_q]*hrs)
  #   run(hi_row, hi_col)
  #   run(hi_row, low_col)
  #   run(low_col, low_col)
  #   run(low_col, hi_col)
  #   @res
  # end
  #
  # def run rows, cols
  #   z = rows.zip cols
  #   b = @board
  #   z.each do |r, c|
  #     return if r.nil? or c.nil?
  #     return if b[r, c] == -1
  #     @res += 1
  #   end
  # end


  def count2
    @res = 0
    @que = %w[n s e w ne nw se sw]
    # @que = %w[n e sw]
    # @que = %w[e w]
    # puts "Q at [#{@r_q},#{@c_q}]"
    b = @board
    do_next
    # b.show
    until @que.empty?
      # puts @que.join ' '
      @que.dup.each do |d|
        v = @dir[d]
        if b[v] == @block or v.min < 0 or v.max >= @lim # or b[*v].nil? or v.min < 0
          @que.delete(d)
          @dir.delete(d)
        else
          # b[v] = 1
          @res+=1
        end
      end
      # b.show
      do_next
    end
    @res
  end

  def do_next
    @dir ||= {}
    old = @dir.dup
    @que.each do |d|
      @dir[d] = next_step(d, @dir[d] || [@r_q, @c_q])
      # (@board[*@dir[d]] = 0 if @board[*@dir[d]])
    end
    new = @dir
    # puts "#{old}\n#{new}"
  end

  def next_step dir, loc
    r, c = loc
    case dir
      when 'e' then
        [r+=1, c]
      when 'w' then
        [r-=1, c]
      when 'n' then
        [r, c+=1]
      when 's' then
        [r, c-=1]
      when 'ne' then
        [r+=1, c+=1]
      when 'nw' then
        [r-=1, c+=1]
      when 'se' then
        [r+=1, c-=1]
      when 'sw' then
        [r-=1, c-=1]
      else
    end
  end
end


rQueen, cQueen = gets.strip.split(' ')
rQueen = rQueen.to_i
cQueen = cQueen.to_i

board = Board.new(n, rQueen, cQueen)

for a0 in (0..k-1)
  rObstacle, cObstacle = gets.strip.split(' ')
  rO = rObstacle.to_i
  cO = cObstacle.to_i
  board.obst(rO, cO)
end
puts board.count2
