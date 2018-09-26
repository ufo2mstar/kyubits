# Longest Substring Without Repeating Characters
# Go to Discuss
# Given a string, find the length of the longest substring without repeating characters.
#
#     Example 1:
#
#     Input: "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
#     Example 2:
#
#     Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
#     Example 3:
#
#     Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
#     Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  ary = s.chars
  set = Hash.new(0)
  max = 0
  lb,ub = 0,0
  ary.each do |n|
    while set[n] != 0 do
      # puts set
      set.delete ary[lb]
      # set[ary[lb]]-=1
      lb+=1
    end
    set[n]+=1
    ub+=1
    # puts set
    max = [max,ub-lb].max
  end
  max
end
