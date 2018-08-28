# Max Consecutive Ones
# Go to Discuss
# Given a binary array, find the maximum number of consecutive 1s in this array.
#
#     Example 1:
#     Input: [1,1,0,1,1,1]
# Output: 3
# Explanation: The first two digits or the last three digits are consecutive 1s.
#     The maximum number of consecutive 1s is 3.
#     Note:
#
#     The input array will only contain 0 and 1.
#         The length of input array is a positive integer and will not exceed 10,000

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  prev_one = -1
  max_count = 0
  nums.each_with_index do |n,i|
    if n == 0
      prev_one = -1
    else
      prev_one = i if prev_one == -1
      this_count = i-prev_one+1
      max_count = [max_count,this_count].max
    end
  end
  max_count
end


# # @param {Integer[]} nums
# # @return {Integer}
def find_max_consecutive_ones(nums)
  return 0 if nums.nil? || nums.empty?
  count = temp_count = 0
  nums.each do |num|
    if(num == 0)
      count = temp_count > count ? temp_count : count
      temp_count = 0
    else
      temp_count += 1
    end
  end
  temp_count > count ? temp_count : count
end


# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  max_count = 0
  this_count = 0
  nums.each do |n,i|
    if n == 1
      this_count+=1
    else
      max_count = [max_count,this_count].max
      this_count = 0
    end
  end
  max_count = [max_count,this_count].max
  max_count
end

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  max_count = 0
  this_count = 0
  nums.each do |n|
    if n == 1
      this_count+=1
    else
      max_count = this_count if this_count > max_count
      this_count = 0
    end
  end
  max_count = this_count if this_count > max_count
  max_count
end
