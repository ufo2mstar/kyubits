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
#     - For the input string "ABBA", the output should be "BA".
#     - For the input string "CCAPAJEBO", the output should be "POJECBA".
#
#         This method represents our core product that we build and sell to customers, so production quality is a must.
#

def get_unique_chars str
  res = {}
  str.chars.each{|c|
    res[c] = 0
  }
  res.keys
end

def better_get_unique_chars str
  str_bin_ary = Array.new 26
  str.chars.each{|c|
    str_bin_ary[c.ord-65] = true
  }
  res = []
  25.downto 0 do |i|
    res << (i+65).chr if str_bin_ary[i]
  end
  res.join
end
