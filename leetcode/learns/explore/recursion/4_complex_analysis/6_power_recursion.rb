# Pow(x, n)
# Go to Discuss
# Implement pow(x, n), which calculates x raised to the power n (xn).
#
#     Example 1:
#
#     Input: 2.00000, 10
# Output: 1024.00000
# Example 2:
#
#     Input: 2.10000, 3
# Output: 9.26100
# Example 3:
#
#     Input: 2.00000, -2
# Output: 0.25000
# Explanation: 2-2 = 1/22 = 1/4 = 0.25
# Note:
#
#     -100.0 < x < 100.0
# n is a 32-bit signed integer, within the range [−231, 231 − 1]
#
#

# @param {Float} x
# @param {Integer} n
# @return {Float}
# def my_pow(x, n)
#     left,right = 0,n
#     while(left >= right) do

#     end
#     x**n
# end

# def stack_too_deep_my_pow(x, n)
#     return 1 if n == 0
#     m = n<0 ? n+1 : n-1
#     return n<0 ? (1/x*my_pow(x,m)) : x*my_pow(x,m)
# end
#

# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1 if n==0
  return (1/my_pow(x,-n)) if n < 0
  if n % 2 == 0
    a = my_pow(x,n/2)
    a*a
  else
    x * my_pow(x,n-1)
  end
end

p my_pow 2,10
p my_pow 2.0,-100
p my_pow 2,1000


# Runtime: 36 ms
# Memory Usage: 9.5 MB
# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow_40(x, n)
  return 1 if n == 0

  if n < 0
    x = 1 / x
    n = n.abs
  end

  kung_pow(x, n)
end

def kung_pow(x, n)
  return 1 if n == 0

  half = kung_pow(x, n / 2)
  if (n % 2 == 0)
    half * half
  else
    half * half * x
  end
end
