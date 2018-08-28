# Minimum Size Subarray Sum
# Go to Discuss
# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
#
# Example:
#
# Input: s = 7, nums = [2,3,1,2,4,3]
# Output: 2
# Explanation: the subarray [4,3] has the minimal length under the problem constraint.
# Follow up:
# If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).

# my 52 MS

# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  return 0 if nums.empty?

  sum_here = 0
  left_i = 0
  min_len = 1.0/0
  curr_len = 0

  nums.each{|n|
    sum_here += n
    curr_len +=1
    while sum_here >= s
      min_len = [min_len,curr_len].min

      sum_here -= nums[left_i]
      left_i+=1

      curr_len -=1
    end
  }

  min_len == 1.0/0 ? 0 : min_len
end


# # 48 MS
#
# # @param {Integer} s
# # @param {Integer[]} nums
# # @return {Integer}
# def min_sub_array_len(s, nums)
#   result = nil
#   h = 0
#   sum = 0
#   nums.each_with_index do |n, i|
#     sum +=n
#     while sum >= s
#       sum -= nums[h]
#       h += 1
#       result = i-h+2 if result.nil? || result > i-h+2
#     end
#   end
#
#   result.nil? ? 0 : result
# end


# # 44 MS
#
# # @param {Integer} s
# # @param {Integer[]} nums
# # @return {Integer}
# def min_sub_array_len(s, nums)
#   sub = sum = start = min_sub = 0
#   for i in 0...nums.length do
#
#     sum += nums[i]; sub += 1
#
#     while start < nums.length && sum - nums[start] >= s
#       sum -= nums[start]
#       start += 1; sub -= 1
#     end
#
#     min_sub = sub if (sum >= s && (sub < min_sub || min_sub == 0))
#
#   end
#   min_sub
# end


# # @param {Integer} s
# # @param {Integer[]} nums
# # @return {Integer}
# def min_sub_array_len(s, nums)
#   ans, sum, left  = Float::INFINITY, 0, 0
#
#   0.upto(nums.size - 1) do |i|
#     sum += nums[i]
#
#     while sum >= s
#       ans   = [ ans, i + 1 - left ].min
#       sum  -= nums[left]
#       left += 1
#     end
#   end
#
#   (ans != Float::INFINITY) ? ans : 0
# end
