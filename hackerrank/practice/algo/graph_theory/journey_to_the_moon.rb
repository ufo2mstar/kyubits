
class Comb

  def self.ncr(n, r)
    a, b  = r, n-r
    a, b  = b, a if a < b # a is the larger
    numer = (a+1..n).inject(1) { |t, v| t*v } # n!/r!
    denom = (2..b).inject(1) { |t, v| t*v } # (n-r)!
    numer/denom
  end

  def self.npr(n, r)
    a, b  = r, n-r
    # a, b  = b, a if a < b # a is the larger
    numer = (1..n).inject(1) { |t, v| t*v } # n!
    denom = (2..b).inject(1) { |t, v| t*v } # (n-r)!
    numer/denom
  end

  def self.facto n
    (1..n).inject(1) { |f, v| f*v } # n!
  end

end


