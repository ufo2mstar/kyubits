#!/bin/ruby

require 'json'
require 'stringio'

# Complete the largestRectangle function below.
def largestRectangle(h)
  # h << 0
  left,ht = [],[]
  max = -1.0/0
  (0...h.size).each do |i|
    if left.empty? or h[i] > ht[-1]
      left << i
      ht << h[i]
    elsif h[i] == ht[-1]
      next
    else
      # do equals case
      last_l = left[-1]
      while left.any? and h[i] < ht[-1]
        l = left.pop
        last_l = l
        s = ht.pop
        max = area_calc max,i,l,s
      end
      # (ht << h[i]; left << last_l) if h[i] < ht[-1]
      (ht << h[i]; left << last_l)
    end
    # puts left,ht,max
  end
  # p "out"
  # puts left,ht,max
  while left.any?
    l = left.pop
    s = ht.pop
    max = area_calc max,h.size,l,s
  end
  # p "final"
  # puts left,ht,max
  max
end

def area_calc max,r,l,h
  area = h * (r-l)
  max = [area,max].max
  # p max
  max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

h = gets.rstrip.split(' ').map(&:to_i)

result = largestRectangle h

fptr.write result
fptr.write "\n"

fptr.close()
