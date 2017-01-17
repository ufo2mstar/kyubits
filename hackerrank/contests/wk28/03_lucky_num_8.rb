#!/bin/ruby

n = gets.strip.to_i
number = gets.strip

class Comb
  def initialize str
    @ary = str.chars
    @n = @ary.length
    @cc  = {}
    @count = 0

  end

  def luck
    @count = 0
    @n.times do |i|
      comb i+1
    end
    @count
  end

  def act s, n
    a    = s
    last = s.last(3).join.to_i
    if last % 8 == 0
      # p a
      @count+=1
    end
    # p "#{n} #{a}"
  end

  def rep n, q, s
    n+=1
    # puts "run n = #{n} q = #{q} s = #{s}"
    until q.empty?
      s << q.shift
      if n == 1
        @num = @ary.length - q.length
      end
      if n == @lim
        act s, @num
        s.pop
      else
        # new_q = q[n-1..-1] || []
        new_q = q[0..-1]
        rep n, new_q, s #if new_q
        # s.shift
      end
    end
    s.pop
  end

  def comb n
    @lim = n
    rep 0, @ary[0..-1], []
    @lim = nil
    # @count = 0
  end


  def comb_count n
    return @cc[n] if @cc[n]
    sum = 0
    n.times { |r| sum+= ncr(n, r) }
    @cc[n] = sum
  end

  private
  def ncr(n, r)
    a, b  = r, n-r
    a, b  = b, a if a < b # a is the larger
    numer = (a+1..n).inject(1) { |t, v| t*v } # n!/r!
    denom = (2..b).inject(1) { |t, v| t*v } # (n-r)!
    numer/denom
  end

end

ans =-> res { puts(res % (10**9+7)) }
c = Comb.new number
ans[c.luck]

