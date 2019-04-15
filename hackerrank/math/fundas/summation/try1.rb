# Summing the N series
#
# Points: 8.57Rank: 129150
# Problem
# Submissions
# Leaderboard
# Discussions
# Editorial
# Topics
# You are given a sequence whose  term is
#
# You have to evaluate the series
# Find .
#     Input Format
#
# The first line of input contains , the number of test cases.
#     Each test case consists of one line containing a single integer .
#
#         Constraints
#
# Output Format
#
# For each test case, print the required answer in a line.
#
#     Sample Input 0
#
# 2
# 2
# 1
# Sample Output 0
#
# 4
# 1
# Explanation 0
#
# Case 1: We have
# Case 2: We have
#


#!/bin/ruby

#
# Complete the summingSeries function below.
#
def summingSeries(n)
  (((2*(n**2)) - (3*n) + 2) % (7+10e9)).to_i
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
  n = gets.to_i

  result = summingSeries n
  puts result

  # fptr.write result
  # fptr.write "\n"
end

# fptr.close()
