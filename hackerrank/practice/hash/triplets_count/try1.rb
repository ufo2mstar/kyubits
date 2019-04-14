#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countTriplets function below.
def countTriplets(arr, r)
  hsh = Hash.new{|h,k| h[k] = []}
  arr.each_with_index{|x,i| hsh[x] << i }
  count = 0
  # if r == 1
  #     hsh.keys.each do |x|
  #         i = hsh[i].size
  #         count += (i*(i-1)*(i-2))/((i-2)*(i-1)) if i >=3
  #     end
  # else
  arr.each_with_index{|x,n|
    i,j,k = x,x*r,x*r*r
    if j == k
      jn = hsh[j].size
      count += (jn*(jn-1)*(jn-2)) if jn >=3
    else
      jn,kn = hsh[j].size, hsh[k].size
      count += jn*kn
    end
    hsh[i].shift
  }
  # end
  count
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nr = gets.rstrip.split

n = nr[0].to_i

r = nr[1].to_i

arr = gets.rstrip.split.map(&:to_i)

ans = countTriplets arr, r

fptr.write ans
fptr.write "\n"

fptr.close()
