# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
#
#     The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
#
#     Note:
#
#     Your returned answers (both index1 and index2) are not zero-based.
#     You may assume that each input would have exactly one solution and you may not use the same element twice.
#     Example:
#
#     Input: numbers = [2,7,11,15], target = 9
# Output: [1,2]
# Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  check_presence=-> idx {
    min_idx = idx+1
    max_idx = numbers.size - 1
    num = numbers[idx]
    target >= num + numbers[min_idx] and target <= num + numbers[max_idx] # true if present
  }

  numbers.each_with_index {|n, i|
    if check_presence[i]
      exp = target - n
      res = bin_search_idx(numbers[(i+1)..(numbers.size - 1)], exp)
      if res
        i_2 = i+1+ res
        return [i+1, i_2+1] if i_2
      end
    end
  }

  []
end

def bin_search_idx ary, aim
  left_i = 0
  right_i = ary.size-1
  while left_i <= right_i
    mid = (right_i+left_i)/2
    if ary[mid] == aim
      return mid
    elsif ary[mid] < aim
      left_i = mid+1
    elsif ary[mid] > aim
      right_i = mid-1
    end
  end
  nil
end
