#!/bin/ruby
ans= %w[Possible Impossible]
q = gets.strip.to_i
for a0 in (0..q-1)
  n = gets.strip.to_i
  M = Array.new(n)
  for M_i in (0..n-1)
    M_t = gets.strip
    M[M_i] = M_t.split(' ').map(&:to_i)
  end
  res = 1
  r_sum = []
  c_sum = []
  # your code goes here
  n.times do |i|
    n.times do |j|
      r_sum[i] ||=0
      c_sum[j] ||=0
      r_sum[i] += M[i][j]
      c_sum[i] += M[j][i]
    end
  end
  res = 0 if (r_sum.sort == c_sum.sort)
  puts ans[res]
end