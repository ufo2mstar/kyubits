# Search for a Range
#          Go to Discuss
#          Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
#
#              Your algorithm's runtime complexity must be in the order of O(log n).
#
# If the target is not found in the array, return [-1, -1].
#
# Example 1:
#
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
# Example 2:
#
# Input: nums = [5,7,7,8,8,10], target = 6
# Output: [-1,-1]

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  return [-1,-1] if nums.nil? or nums.empty?
  left,right = 0,nums.size-1
  mid = bin_search nums,left,right,target
  [get_left_res(nums,left,right,target,mid),get_right_res(nums,left,right,target,mid)]
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

def get_left_res ary,left,right,target,res
  mid = res
  loop do
    mid = bin_search(ary,left,mid-1,target)
    break if mid == -1
    res = mid
  end
  res
end


def get_right_res ary,left,right,target,res
  mid = res
  loop do
    mid = bin_search(ary,mid+1,right,target)
    break if mid == -1
    res = mid
  end
  res
end
