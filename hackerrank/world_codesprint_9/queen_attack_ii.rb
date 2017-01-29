require 'matrix'

class Matrix
  def sum
    self.to_a.flatten.reduce(&:+)
  end

  def []=(i, j, x)
    @rows[i][j] = x
  end
end

n, k = gets.strip.split(' ')
n = n.to_i
k = k.to_i

class Board
  def initialize n, r_q, c_q
    @board = make_board n
    @r_q, @c_q = r_q-1, c_q-1
    @lim = n
    obst(@r_q, @c_q, 9)
  end

  def make_board n
    Matrix.build(n) { 0 }
  end

  def obst(rO, cO, val = -1)
    @board[rO-1, cO-1] = val
  end

  def count
    @res = 0
    low_row = (0...@r_q).to_a.reverse
    hi_row = (@r_q+1...@lim).to_a
    low_col = (0...@c_q).to_a.reverse
    hi_col = (@c_q+1...@lim).to_a
    r,c = hi_row.size,hi_row.size
    run([@r_q]*r, low_col)
    run([@r_q]*r, hi_col)
    run(low_row, [@c_q]*c)
    run(hi_row, [@c_q]*c)
    run(hi_row, hi_col)
    run(low_col, low_col)
    @res
  end

  def run r,c
    t = r.size
    b = @board
    t.times do |i|
      return if b[r[i],c[i]] == -1
      @res += 1
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
puts board.count
