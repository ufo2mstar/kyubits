# PracticeAlgorithmsStringsSherlock and Anagrams
# Sherlock and Anagrams
#
# 13.94 more points to get your gold badge!
# Rank: 87513|Points: 836.06/850
# Problem Solving
# Problem
# Submissions
# Leaderboard
# Discussions
# Editorial
# Topics
# Two strings are anagrams of each other if the letters of one string can be rearranged to form the other string. Given a string, find the number of pairs of substrings of the string that are anagrams of each other.
#
#     For example , the list of all anagrammatic pairs is  at positions respectively.
#
#         Function Description
#
# Complete the function sherlockAndAnagrams in the editor below. It must return an integer that represents the number of anagrammatic pairs of substrings in .
#
#     sherlockAndAnagrams has the following parameter(s):
#
#     s: a string .
#     Input Format
#
# The first line contains an integer , the number of queries.
#     Each of the next  lines contains a string  to analyze.
#
#     Constraints
#
#
#
# String  contains only lowercase letters  ascii[a-z].
#
#     Output Format
#
# For each query, return the number of unordered anagrammatic pairs.
#
#     Sample Input 0
#
# 2
# abba
# abcd
# Sample Output 0
#
# 4
# 0
# Explanation 0
#
# The list of all anagrammatic pairs is  and  at positions  and  respectively.
#
#     No anagrammatic pairs exist in the second query as no character repeats.
#
#     Sample Input 1
#
# 2
# ifailuhkqq
# kkkk
# Sample Output 1
#
# 3
# 10
# Explanation 1
#
# For the first query, we have anagram pairs  and  at positions  and respectively.
#
#     For the second query:
#                        There are 6 anagrams of the form  at positions  and .
#     There are 3 anagrams of the form  at positions  and .
#     There is 1 anagram of the form  at position .
#
#     Sample Input 2
#
# 1
# cdcd
# Sample Output 2
#
# 5
# Explanation 2
#
# There are two anagrammatic pairs of length :  and .
#     There are three anagrammatic pairs of length :  at positions  respectively.


#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sherlockAndAnagrams function below.
# def sherlockAndAnagrams(s)


# end

def anagram_pairs_count(str)
  substrs = Hash.new()

  for l in 0..(str.length - 1)
    for h in l..(str.length - 1)
      substr = str[l..h]
      substrs[substr.length] ||= Hash.new(0)
      substrs[substr.length][substr.chars.sort.join] += 1
    end
  end

  total = 0

  substrs.each do |substr_length, anagram_to_count|
    pairs_count_list = anagram_to_count.values.map do |cnt|
      (cnt * (cnt - 1)) / 2
    end
    total += pairs_count_list.reduce(&:+)
  end
  total
end

def sherlockAndAnagrams(str)
  anagram_pairs_count(str)
#   counter = Hash.new(0)
#   (1...str.length).each do |len|
#     str.chars.each_cons(len) do |substr|
#       counter[substr.sort.join] += 1
#     end
#   end
#   counter.values.map { |n| n * (n - 1) / 2 }.reduce(:+)
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
  s = gets.to_s.rstrip

  result = sherlockAndAnagrams s

  fptr.write result
  fptr.write "\n"
end

fptr.close()
