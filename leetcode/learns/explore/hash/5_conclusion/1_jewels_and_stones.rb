# Jewels and Stones
# Go to Discuss
# You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
#
# The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
#
# Example 1:
#
# Input: J = "aA", S = "aAAbbbb"
# Output: 3
# Example 2:
#
# Input: J = "z", S = "ZZ"
# Output: 0
# Note:
#
# S and J will consist of letters and have length at most 50.
# The characters in J are distinct.

# @param {String} j
# @param {String} s
# @return {Integer}
def pattern_match_jewels_in_stones(j, s)
  return 0 if s.size > j.size
  set = {}
  set[j] = true
  sub_s = s[0...j.size]
  count = 0
  (s.size - j.size).times do |i|
    count+=1 if set[sub_s]
    puts sub_s
    idx = j.size+i
    sub_s.shift
    sub_s << s[idx]
  end
  count
end

# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  j_set = Hash.new()

  j.chars.each{|n| j_set[n]=0}
  s.chars.each{|n| j_set[n]+=1 if j_set[n]}
  puts j_set
  j_set.values.reduce(:+)
end


j="aA"
s="aAAbbbb"
puts num_jewels_in_stones(j, s)
