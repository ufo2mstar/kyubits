# Bad try! with sorted list assumptions and bin search.. better is

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum_bad(numbers, target)
  component_is_present=-> idx {
    min_idx = idx+1
    return false if min_idx >= numbers.size
    max_idx = numbers.size - 1
    num = numbers[idx]
    target >= num + numbers[min_idx] and target <= num + numbers[max_idx] # true if present
  }

  numbers.each_with_index {|n, i|
    if component_is_present[i]
      exp = target - n
      res = bin_search_idx(numbers[(i+1)..(numbers.size - 1)], exp)
      if res
        i_2 = i+1+ res
        return [i, i_2] if i_2
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


# good solution! (better than any other results here apparently!! :D finally evidence that margritas work)
# Two Sum
# Go to Discuss
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
#     You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
#     Example:
#
#     Given nums = [2, 7, 11, 15], target = 9,
#
#           Because nums[0] + nums[1] = 2 + 7 = 9,
#     return [0, 1].
#
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  set = {}
  numbers.each_with_index{|n,i|
    exp = target - n
    return [set[exp], i] if set[exp] and (exp != n or i > 0)
    set[n] = i
  }
end
