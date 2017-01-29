# https://www.hackerrank.com/contests/world-codesprint-9/challenges/box-operations

# 1 l r c: Add  to each . Note that  can be negative.
#     2 l r d: Replace each  with .div d floor
#     3 l r: Print the minimum value of any .
#     4 l r: Print the sum of all .

#!/bin/ruby

n,q = gets.strip.split(' ')
n = n.to_i
q = q.to_i
box = gets.strip
box = box.split(' ').map(&:to_i)
# your code goes here
