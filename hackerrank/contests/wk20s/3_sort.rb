  N=10000
30.times { |num|
  size = num
  size = gets.chomp.to_i
  ary = gets.chomp.split.map(&:to_i)
  size = ary.uniq.size
  n=6
  sum, old_sum = 0, -1
  N.times { |i|
    sum+=i*Math.gamma(size+1)**(-i).to_f
    (i; break) if old_sum == sum.round(n)
    old_sum = sum.round(n)
  }
  puts sum.round(n)
}
