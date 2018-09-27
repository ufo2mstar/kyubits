# Isomorphic Strings
# Go to Discuss
# Given two strings s and t, determine if they are isomorphic.
#
#     Two strings are isomorphic if the characters in s can be replaced to get t.
#
#     All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
#
#     Example 1:
#
#     Input: s = "egg", t = "add"
# Output: true
# Example 2:
#
#     Input: s = "foo", t = "bar"
# Output: false
# Example 3:
#
#     Input: s = "paper", t = "title"
# Output: true
# Note:
#     You may assume both s and t have the same length.
#
#

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  set_s = Hash.new {|h,k|h[k] = []}
  set_t = Hash.new {|h,k|h[k] = []}

  s.chars.each_with_index{|c,i| set_s[c] << i}
  t.chars.each_with_index{|c,i| set_t[c] << i}

  set_s.values.sort == set_t.values.sort
end
