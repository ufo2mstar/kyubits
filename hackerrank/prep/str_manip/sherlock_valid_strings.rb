#!/bin/ruby

require 'json'
require 'stringio'

# Complete the isValid function below.
def isValid(s)
  code_counts = get_counts_hash s.chars
  freq_counts = get_counts_hash code_counts.values
  # puts str_counts
  freq_counts.size == 1 or (freq_counts.size == 2 and
      (freq_counts.values.min == 1 or ((freq_counts.values[0]-freq_counts.values[1]).abs == 1))) ? "YES" : "NO"
  [freq_counts.values,freq_counts, freq_counts.size == 1, freq_counts.size == 2 , freq_counts.values.min == 1 , ((freq_counts.values[0]-freq_counts.values[1]).abs == 1)]
end

def get_counts_hash ary
  str_counts = {}
  str_counts.default = 0
  ary.each{|c|str_counts[c.to_s]+=1}
  str_counts
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = isValid s

fptr.write result
fptr.write "\n"

fptr.close()
