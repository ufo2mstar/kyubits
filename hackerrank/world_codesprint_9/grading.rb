# https://www.hackerrank.com/contests/world-codesprint-9/challenges

#!/bin/ruby

n = gets.strip.to_i
for a0 in (0..n-1)
  grade = gets.strip.to_i
  if grade >= 38
    mod = grade % 5
    diff = 5 - mod
    grade += diff if diff < 3
  end
  puts grade
end
