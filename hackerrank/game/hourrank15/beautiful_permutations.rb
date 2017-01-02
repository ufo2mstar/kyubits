# https://www.hackerrank.com/contests/hourrank-15/challenges/taras-beautiful-permutations

# Enter your code here. Read input from STDIN. Print output to STDOUT

ans =-> res {res % (10**9+7)}

g = gets.strip.to_i
g.times do
  n = gets.strip.to_i
  a = gets.split(' ').map(&:to_i)
  p ans[a[0]]
end