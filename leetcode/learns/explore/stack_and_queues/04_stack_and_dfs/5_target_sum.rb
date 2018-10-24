# Target Sum
# Go to Discuss
# You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.
#
#     Find out how many ways to assign symbols to make sum of integers equal to target S.
#
#         Example 1:
#     Input: nums is [1, 1, 1, 1, 1], S is 3.
#     Output: 5
# Explanation:
#
#     -1+1+1+1+1 = 3
# +1-1+1+1+1 = 3
# +1+1-1+1+1 = 3
# +1+1+1-1+1 = 3
# +1+1+1+1-1 = 3
#
# There are 5 ways to assign symbols to make the sum of nums be target 3.
#     Note:
#     The length of the given array is positive and will not exceed 20.
#     The sum of elements in the given array will not exceed 1000.
#     Your output answer is guaranteed to be fitted in a 32-bit integer.


require 'awesome_print'

# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways_1(nums, s)
  @count = 0
  terrible_dfs(0,nums,s)
  @count
end

def terrible_dfs(sum,array,target)
  ary = array.clone
  if !ary.empty?
    num = ary.pop
    sum_plus = sum + num
    dfs(sum_plus,ary,target)
    sum_minus = sum - num
    dfs(sum_minus,ary,target)
  elsif sum == target
    @count+=1
  end
end

def find_target_sum_ways_2(nums, s)
  @count = 0
  dfs_2(0,0,nums,s)
  @count
end

def dfs_2(sum,i,ary,target)
  if i < ary.size
    num = ary[i]
    dfs_2(sum + num, i+1,ary,target)
    dfs_2(sum - num, i+1,ary,target)
  elsif sum == target
    @count+=1
  end
end


# def find_target_sum_ways(nums, s)
#   @count = {}
#   dfs(0,0,nums,s,@count)
# end
#
# def dfs(sum,i,ary,target,count)
#   ways = 0
#   if count["#{i},#{sum}"].nil?
#     if i < ary.size
#       num = ary[i]
#       ways += dfs(sum + num, i+1,ary,target,count)
#       ways += dfs(sum - num, i+1,ary,target,count)
#       count["#{i},#{sum}"] = ways
#     else
#       return sum == target ? 1 : 0
#     end
#   else
#     count["#{i},#{sum}"]
#   end
# end


# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
  min, max, len = 0, 0, 0
  nums.each do |n|
    min -= n
    max += n
    len += 1
  end

  return 0 if len == 0

  if s < min || s > max
    return 0
  end

  range = max - min + 1
  dp = Array.new len
  for i in (0..len-1)
    dp[i] = Array.new range, 0
  end

  dp[0][min.abs + nums[0]] += 1
  dp[0][min.abs - nums[0]] += 1

  for i in (1..len-1)
    for j in (0..range-1)
      unless j - nums[i] < 0
        dp[i][j] += dp[i-1][j-nums[i]]
      end

      unless j + nums[i] > range-1
        dp[i][j] += dp[i-1][j+nums[i]]
      end
    end
  end

  # ap dp
  width = dp.flatten.max.to_s.size+2
  res = dp.map {|a| a.map { |i| i.to_s.rjust(width) }.join }
  puts res
  dp[len-1][min.abs + s]
end


nums = [1,1,1,1,1]
s = 3

puts find_target_sum_ways(nums, s)

nums = [35,34,21,14,46,49,36,7,17,39,41,12,38,18,8,31,10,22,39,11]
s=26

puts find_target_sum_ways(nums, s)

