#!/bin/ruby

require 'json'
require 'stringio'

# Complete the alternatingCharacters function below.
def alternatingCharacters(s)
  last_chr = ""
  rep = 0
  return nil if s.empty?
  s.chars.each{|chr|
    rep+=1 if chr == last_chr
    last_chr = chr
  }
  rep
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
  s = gets.to_s.rstrip

  result = alternatingCharacters s

  fptr.write result
  fptr.write "\n"
end

fptr.close()
