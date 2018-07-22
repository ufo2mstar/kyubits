#!/bin/ruby

require 'json'
require 'stringio'

# Complete the substrCount function below.
def substrCount(n, s)
  # palins_ary = []
  palins_ary_count = 0
  for len in 0..n
    head = 0
    tail = head + len
    while tail < n
      sub_str = s[head..tail]
      # palins_ary << sub_str if isPalindrome sub_str
      palins_ary_count+=1 if isPalindrome sub_str
      head+=1
      tail = head + len
    end
  end
  # [palins_ary,palins_ary.count]
  palins_ary_count
end

def isPalindrome s
  ary = s.chars
  return false if ary.empty?

  ary.slice! ary.size/2 if ary.size % 2 != 0
  idx = ary.size/2 - 1

  spl_str = ary[idx]
  while idx >= 0
    return false if spl_str != ary[ary.size-1-idx]
    idx-=1
  end

  return true
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = substrCount n, s

fptr.write result
fptr.write "\n"

fptr.close()
