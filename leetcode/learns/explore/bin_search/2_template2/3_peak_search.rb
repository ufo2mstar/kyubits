# Find Peak Element
# Go to Discuss
# A peak element is an element that is greater than its neighbors.
#
#     Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
#
#     The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
#
#     You may imagine that nums[-1] = nums[n] = -∞.
#
#         Example 1:
#
#     Input: nums = [1,2,3,1]
# Output: 2
# Explanation: 3 is a peak element and your function should return the index number 2.
#     Example 2:
#
#     Input: nums = [1,2,1,3,5,6,4]
# Output: 1 or 5
# Explanation: Your function can return either index number 1 where the peak element is 2,
# or index number 5 where the peak element is 6.
#     Note:
#
#     Your solution should be in logarithmic complexity.

# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  left, right = 0, nums.size-1
  while left<right
    mid = (left+right)/2
    if peak_check(nums, mid)
      return mid
    else
      if ascending_right?(nums, mid)
        left = mid+1
      else
        right = mid
      end
    end
  end
  right
end

def peak_check nums, mid
  if mid == 0
    nums[mid] > nums[mid+1]
  elsif mid == nums.length-1
    nums[mid-1] < nums[mid]
  else
    nums[mid-1] < nums[mid] and nums[mid] > nums[mid+1]
  end
end

def ascending_right? nums, mid
  if mid == nums.length-1
    nums[mid-1] < nums[mid]
    # elsif mid == 0
    # nums[mid] < nums[mid+1]
  else
    nums[mid] < nums[mid+1]
  end
end
