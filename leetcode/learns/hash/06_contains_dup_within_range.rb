# Contains Duplicate II
# Go to Discuss
# Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
#
#     Example 1:
#
#     Input: nums = [1,2,3,1], k = 3
# Output: true
# Example 2:
#
#     Input: nums = [1,0,1,1], k = 1
# Output: true
# Example 3:
#
#     Input: nums = [1,2,3,1,2,3], k = 2
# Output: false

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hsh = Hash.new {|h,k| h[k] = []}
  nums.each_with_index{|n,i|
    hsh[n] << i
  }
  hsh.keys.each{|n|
    return true if two_diff hsh[n],k
  }
  false
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_diff(numbers, target)
  set = {}
  numbers.each_with_index{|n,i|
    exp = target + n
    rng = n-target..n+target
    rng.each{|k|
      return true if set[k]
    }
    set[n] = i
  }
  return false
end
