# 561. Array Partition I
# DescriptionHintsSubmissionsDiscussSolution
# Given an array of 2n integers, your task is to group these integers into n pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of min(ai, bi) for all i from 1 to n as large as possible.
#
#     Example 1:
#     Input: [1,4,3,2]
#
# Output: 4
# Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3, 4).
#         Note:
#     n is a positive integer, which is in the range of [1, 10000].
#     All the integers in the array will be in the range of [-10000, 10000].

# @param {Integer[]} nums
# @return {Integer}
def array_pair_sum(nums)
  sorted_nums = nums.sort
  n = nums.size/2
  sum = 0
  n.times do |i|
    sum+=[sorted_nums[2*i],sorted_nums[2*i+1]].min
  end
  sum
end
