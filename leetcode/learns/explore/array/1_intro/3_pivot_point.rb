# Find Pivot Index
# Go to Discuss
# Given an array of integers nums, write a method that returns the "pivot" index of this array.
#
#     We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.
#
#         If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.
#
#     Example 1:
#     Input:
#     nums = [1, 7, 3, 6, 5, 6]
# Output: 3
# Explanation:
#     The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
#     Also, 3 is the first index where this occurs.
#     Example 2:
#     Input:
#     nums = [1, 2, 3]
# Output: -1
# Explanation:
#     There is no index that satisfies the conditions in the problem statement.
#     Note:
#
#     The length of nums will be in the range [0, 10000].
#     Each element nums[i] will be an integer in the range [-1000, 1000].

# @param {Integer[]} nums
# @return {Integer}
def shameful_pivot_index(nums)
  return -1 if nums.empty?
  rsum = Array.new(nums.size,0)
  nums.each_with_index{|n,i| rsum[i] = i == 0 ? 0 : rsum[i-1] + nums[i-1] }
  # p rsum
  tot = rsum[-1]+nums[-1]
  lsum = Array.new(nums.size,0)
  lsum[-1]=tot
  nums.each_with_index{|n,i| j = nums.size - 1 - i; lsum[j] = i == 0 ? 0 : i == 1 ? nums[j+1] : lsum[j+1] + nums[j+1] }
  # p lsum
  diffsum = Array.new(nums.size,0)
  nums.each_with_index{|n,i| diffsum[i] = rsum[i]-lsum[i]}
  # p diffsum
  # x = sum[-1]/2
  # bin_find diffsum,0
  diffsum.each_with_index{|n,i| return i if n == 0}
  -1
end

def bin_find nums, x
  l,r = 0,nums.size-1
  while(l<=r) do
    mid = l+(r-l)/2
    if nums[mid] == x
      return mid
    else
      p "l #{l} r #{r} #{nums[mid]} ? #{(nums[0] < nums[-1] and nums[mid] < x)} or #{nums[mid] > x}"
      if (nums[0] < nums[-1] and nums[mid] < x) or (nums[0] > nums[-1] and nums[mid] > x)
        l = mid+1
      else
        r=mid-1
      end
    end
  end
  -1
end


# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  tots = nums.reduce(:+)
  left = 0
  nums.each_with_index do |n,i|
    right = tots - left - n
    return i if left == right
    left = left + n
  end
  -1
end
