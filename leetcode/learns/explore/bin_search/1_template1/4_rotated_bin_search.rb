#
# Search in Rotated Sorted Array
# Go to Discuss
# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
#
#                                                                                        (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
#
#     You are given a target value to search. If found in the array return its index, otherwise return -1.
#
#     You may assume no duplicate exists in the array.
#
#     Your algorithm's runtime complexity must be in the order of O(log n).
#
# Example 1:
#
# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4
# Example 2:
#
# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  return -1 if nums.empty?

  rot_idx = rot_point nums,0,nums.size-1
  left = nums[0]
  if rot_idx == -1
    bin_search nums, target
  elsif left <= target
    bin_search nums[0..rot_idx], target
  else
    res = bin_search(nums[rot_idx+1..nums.size-1], target)
    return rot_idx +1+ res if res != -1
    res
  end
end

def bin_search ary, target
  left = 0
  right = ary.size-1
  while left <= right
    mid = (left+right)/2
    if ary[mid]==target
      return mid
    else
      if ary[mid] > target
        right = mid-1
      else
        left = mid+1
      end
    end
  end
  -1
end

def rot_point ary,left,right
  if ary[right] < ary[left]
    low = ary[right]
    mid = (left+right)/2
    if ary[mid] > ary[mid+1]
      return mid
    else
      if ary[mid]>low
        left = mid+1
      else
        right = mid
      end
    end
    return rot_point ary,left,right
  else
    return -1
  end
end

# hitting 100% but a simpler and elegent soln here


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_better(nums, target)
  left, right = 0, nums.size-1
  while left <= right
    mid = left + (right-left)/2

    return mid if nums[mid] == target

    if nums[mid] < nums[left] #
      if target > nums[mid] && target <= nums[right]
        left = mid+1
      else
        right = mid-1
      end
    elsif nums[mid] > nums[left]
      if target < nums[mid] && target >= nums[left]
        right = mid-1
      else
        left = mid+1
      end
    else
      left += 1
    end
  end

  -1
end
