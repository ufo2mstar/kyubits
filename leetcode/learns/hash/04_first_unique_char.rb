# First Unique Character in a String
# Go to Discuss
# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
#
#     Examples:
#
#     s = "leetcode"
# return 0.
#
#     s = "loveleetcode",
#     return 2.
#     Note: You may assume the string contain only lowercase letters.

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  uniq_hsh = {}
  uniq_hsh.default = 0

  s.chars.each{|c|
    uniq_hsh[c]+=1
  }

  s.chars.each_with_index{|c,i|
    return i if uniq_hsh[c] == 1
  }

  return -1
end
