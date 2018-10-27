# Binary Search
# Go to Discuss
# Given a sorted (in ascending order) integer array nums of n elements and a target value, write a function to search target in nums. If target exists, then return its index, otherwise return -1.
#
#
#     Example 1:
#
#     Input: nums = [-1,0,3,5,9,12], target = 9
# Output: 4
# Explanation: 9 exists in nums and its index is 4
#
# Example 2:
#
#     Input: nums = [-1,0,3,5,9,12], target = 2
# Output: -1
# Explanation: 2 does not exist in nums so return -1
#
#
# Note:
#
#     You may assume that all elements in nums are unique.
#     n will be in the range [1, 10000].
#     The value of each element in nums will be in the range [-9999, 9999].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 if nums.empty?
  return -1 if nums[-1] < target
  return -1 if nums[0] > target
  bin_search nums,0,nums.size-1,target
end

def bin_search ary,left,right,target
  return -1 if left > right
  mid = (left+right)/2
  if ary[mid] == target
    return mid
  else
    ary[mid] < target ? bin_search(ary,mid+1,right,target) : bin_search(ary,left,mid-1,target)
  end
end

# beats 100%
