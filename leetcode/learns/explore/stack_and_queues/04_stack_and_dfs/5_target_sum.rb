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

def find_target_sum_ways(nums, s)
  @count = 0
  dfs(0,0,nums,s)
  @count
end

def dfs(sum,i,ary,target)
  if i < ary.size
    num = ary[i]
    dfs(sum + num, i+1,ary,target)
    dfs(sum - num, i+1,ary,target)
  elsif sum == target
    @count+=1
  end
end

nums = [1,1,1,1,1]
s = 3

puts find_target_sum_ways(nums, s)

nums = [35,34,21,14,46,49,36,7,17,39,41,12,38,18,8,31,10,22,39,11]
s=26

puts find_target_sum_ways(nums, s)
