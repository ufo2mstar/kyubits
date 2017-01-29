require 'matrix'

class Matrix
  def sum
    self.to_a.flatten.reduce(&:+)
  end

  def []=(i, j, x)
    @rows[i][j] = x
  end
end

m = Matrix.build(3) {rand}
puts m.sum
m = Matrix.build(3) { 0 }
puts m.sum
m[1,2] = 1
puts m



