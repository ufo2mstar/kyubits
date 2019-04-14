# Largest Rectangle
#
# 118.94 more points to get your gold badge!
# Rank: 101668|Points: 731.06/850
# Problem Solving
# Problem
# Submissions
# Leaderboard
# Discussions
# Editorial
# Skyline Real Estate Developers is planning to demolish a number of old, unoccupied buildings and construct a shopping mall in their place. Your task is to find the largest solid area in which the mall can be constructed.
#
#     There are a number of buildings in a certain two-dimensional landscape. Each building has a height, given by . If you join  adjacent buildings, they will form a solid rectangle of area .
#
#     For example, the heights array . A rectangle of height  and length  can be constructed within the boundaries. The area formed is .
#
#     Function Description
#
# Complete the function largestRectangle int the editor below. It should return an integer representing the largest rectangle that can be formed within the bounds of consecutive buildings.
#
#     largestRectangle has the following parameter(s):
#
#     h: an array of integers representing building heights
# Input Format
#
# The first line contains , the number of buildings.
#     The second line contains  space-separated integers, each representing the height of a building.
#
#     Constraints
#
# Output Format
#
# Print a long integer representing the maximum area of rectangle formed.
#
#     Sample Input
#
# 5
# 1 2 3 4 5
# Sample Output
#
# 9
# Explanation
#
# An illustration of the test case follows.
#     image
#
# Ruby
#


#!/bin/ruby

require 'json'
require 'stringio'

# Complete the largestRectangle function below.
# def largestRectangle(h)
#     rec_util h,1,0,[[h[0],0]]
# end

def largestRectangleSoln(h)
  max, stack = 0, [[h[0],0]]
  for i in 1...h.size
      if h[i]>h[i-1]
          stack.push [h[i],i]
      else
          l2=nil
          while stack.any? and stack[-1][0]>h[i]
              l = stack.pop
              l2 = l[1]
              max = [max, l[0]*(i-l[1])].max
          end
          stack.push [h[i], l2 ? l2 : i]
      end
  end
  stack.each{|b| max = [max, b[0]*(h.size-b[1])].max}
  max
end

def largestRectangle(h)
  rec_util h, 0, 0, []
end

def rec_util h, i, max, stk
  h << 0
  (0...h.size).each do |i|
    if stk.empty? or h[i] >= stk[-1]
      stk << i
    else
      max = area_calc h, i, max, stk
    end
  end
  # max = area_calc h,h.size-1,max,stk if stk.any?
  max
end

def area_calc h, i, max, stk
  while i == h.size - 1 or (h[i] < stk[-1])
    l = stk.pop
    if stk.empty?
      area = h[l] * (i)
    else
      area = h[l] * (i - l + 1)
    end
    max = [max, area].max
    p max
    return max if stk.empty?
  end
  max
end

def rec_util_broken h, i, max, stk
  if i < h.size - 1 and (stk.empty? or h[i] > h[-1])
    stk << i
    max = rec_util h, i + 1, max, stk
  else
    max = area_check h, i, max, stk
    max = rec_util h, i + 1, max, stk unless i == h.size - 1
  end
  max
end

def area_check h, i, max, stk
  while i == h.size - 1 or (h[i] <= h[-1])
    return max if stk.empty?
    l = stk.pop
    area = h[i] * (i - l - 1)
    max = [max, area].max
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

h = gets.rstrip.split(' ').map(&:to_i)

result = largestRectangle h

fptr.write result
fptr.write "\n"

fptr.close()

