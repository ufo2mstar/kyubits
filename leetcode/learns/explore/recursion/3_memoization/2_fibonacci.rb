# Fibonacci Number
# Go to Discuss
# The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,
#
#                                                                                                                                                                                      F(0) = 0,   F(1) = 1
# F(N) = F(N - 1) + F(N - 2), for N > 1.
#     Given N, calculate F(N).
#
#
#
#         Example 1:
#
#     Input: 2
# Output: 1
# Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
#         Example 2:
#
#     Input: 3
# Output: 2
# Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
#         Example 3:
#
#     Input: 4
# Output: 3
# Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
#
#
#         Note:
#
#     0 ≤ N ≤ 30.
#

# @param {Integer} n
# @return {Integer}
def fib_1(n)
  @fib ||= {}
  return n if n < 2
  return @fib[n] = fib(n-1) + fib(n-2)
end

# Runtime: 32 ms
# Memory Usage: 9.4 MB
#
def fib_2 n
  a,b = 0,1
  n.times do
    a,b = b,a+b
  end
  a
end


# Runtime: 376 ms
# Memory Usage: 9.4 MB
# @param {Integer} n
# @return {Integer}
def fib(n)
  hsh = {}
  fib_rec n,hsh
end

# Runtime: 32 ms
# Memory Usage: 9.4 MB
def fib_rec n,hsh
  return n if n < 2
  return hsh[n] if hsh[n]
  return hsh[n] = fib_rec(n-1,hsh) + fib_rec(n-2,hsh)
end
