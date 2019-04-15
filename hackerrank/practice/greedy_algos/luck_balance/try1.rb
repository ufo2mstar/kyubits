#!/bin/ruby

require 'json'
require 'stringio'

# Complete the luckBalance function below.
def luckBalance(k, contests)
  luck = 0
  impts = []
  norms = []
  contests.each{|c,i| i == 1 ? impts << c : norms << c }
  impts = impts.sort
  norms = norms.sort
  # conts = norms + impts
  while(k>0)
    if impts.any?
      c = impts.pop
      luck+= c
      # elsif norms.any?
      #     c = norms.pop
      #     luck+= c
    end
    k-=1
  end
  luck-=impts.reduce(:+)||0
  luck+=norms.reduce(:+)||0
  luck
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

contests = Array.new(n)

n.times do |i|
  contests[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = luckBalance k, contests

fptr.write result
fptr.write "\n"

fptr.close()
