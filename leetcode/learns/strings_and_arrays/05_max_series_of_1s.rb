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
# def find_max_consecutive_ones(nums)
#   return 0 if nums.nil? || nums.empty?
#   count = temp_count = 0
#   nums.each do |num|
#     if(num == 0)
#       count = temp_count > count ? temp_count : count
#       temp_count = 0
#     else
#       temp_count += 1
#     end
#   end
#   temp_count > count ? temp_count : count
# end
