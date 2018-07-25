# require 'combos'

#
# Problem statement
#
# Use a programming language of your choice.Write a method that accepts a string as an input and which also outputs a string.
#     The input string contains chars given in a random order and length.Multiple occurrences of the
# same chars are allowed in the input string.The function should return a string using the same chars from
# the input string with two core requirements: (1) If there are multiple occurrences of the same char, only one unique occurrence
# of that char is allowed and (2) the chars must be sorted in a descending order.
#
#     Examples :
#     -For the input string "ABBA", the output should be "BA".
#     - For the input string "CCAPAJEBO", the output should be "POJECBA".
#
#         This method represents our core product that we build and sell to customers, so production quality is a must.
#

def unique(str)
  return str if str.nil?
  set = Set.new
  str.chars.each {|c| set << c}
  set.to_a.sort.reverse.join
end


def pure_unique str
  return str if str.nil?
  res = []
  # check = ("Z".."A").to_a [Z,Y,X..B,A]
  # true false
  # [1 0 0 ]
  inp_ary = Array.new(26)
  str.each {|c| inp_ary[c.ord-65] = true}
  inp_ary.each_with_index {|b, i| res.unshift((i+65).chr) if b == true}
  res.join
end