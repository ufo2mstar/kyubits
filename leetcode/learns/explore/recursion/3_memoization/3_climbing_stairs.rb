# Climbing Stairs
# Go to Discuss
# You are climbing a stair case. It takes n steps to reach to the top.
#
#     Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
#
# Note: Given n will be a positive integer.
#
#     Example 1:
#
#     Input: 2
# Output: 2
# Explanation: There are two ways to climb to the top.
#     1. 1 step + 1 step
#     2. 2 steps
# Example 2:
#
#     Input: 3
# Output: 3
# Explanation: There are three ways to climb to the top.
#     1. 1 step + 1 step + 1 step
#     2. 1 step + 2 steps
#     3. 2 steps + 1 step
#

# @param {Integer} n
# @return {Integer}
def climb_stairs_brute(n)
  hsh={}
  ways = 0
  climb n
end

def climb n
  return 0 if n < 0
  return 1 if n == 0
  climb(n-1) + climb(n-2)
end

# p climb_stairs_brute 81


# @param {Integer} n
# @return {Integer}
def climb_stairs_rec(n)
  hsh={}
  climb_cache n,hsh
end

def climb_cache n,hsh
  return 0 if n < 0
  return 1 if n == 0
  return hsh[n] if hsh[n]
  hsh[n] = climb_cache(n-1,hsh) + climb_cache(n-2,hsh)
end

# p climb_stairs_rec 18

