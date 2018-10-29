# Find K Closest Elements
# Go to Discuss
# Given a sorted array, two integers k and x, find the k closest elements to x in the array. The result should also be sorted in ascending order. If there is a tie, the smaller elements are always preferred.
#
#     Example 1:
#     Input: [1,2,3,4,5], k=4, x=3
# Output: [1,2,3,4]
# Example 2:
#     Input: [1,2,3,4,5], k=4, x=-1
# Output: [1,2,3,4]
# Note:
#     The value k is positive and will always be smaller than the length of the sorted array.
#         Length of the given array is positive and will not exceed 104
# Absolute value of elements in the array and x will not exceed 104
# UPDATE (2017/9/19):
#     The arr parameter had been changed to an array of integers (instead of a list of integers). Please reload the code definition to get the latest changes.

# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_closest_elements(nums, k, target)
  return [] if nums.nil? or nums.empty?
  return nums if nums.size == k
  left,right = 0,nums.size-1

  mid =
      if nums[left] >= target
        left
      elsif nums[right] <= target
        right
      else
        bin_search nums,left,right,target
      end

  p "mid = "+mid.to_s
  res = [nums[mid]]
  l,r = mid-1,mid+1
  x=target
  while res.size < k and l >= left and r <= right do
    if x - nums[l] <= nums[r] - x
      res.unshift nums[l]
      l-=1
    else
      res << nums[r]
      r+=1
    end
    # p res
  end

  while l >= left and res.size < k
    res.unshift nums[l]
    l-=1
    # p res
  end

  while r <= right and res.size < k
    res << nums[r]
    r+=1
    # p res
  end

  res
end


def bin_search ary,left,right,target
  return right if left > right
  mid = (left+right)/2
  if ary[mid] == target
    return mid
  else
    ary[mid] < target ? bin_search(ary,mid+1,right,target) : bin_search(ary,left,mid-1,target)
  end
end
