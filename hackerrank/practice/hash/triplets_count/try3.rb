#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countTriplets function below.
def countTriplets(arr, r)
  hsh = Hash.new{}
  hsh.default = 0
  # arr.each_with_index{|x,i| hsh[x] +=1 }
  count = 0

  (arr).each_with_index{|x,n|
    i,j,k = x/r**2 , x/r , x
    hsh[x] += 1
    if n > 1
      if j == k
        jn = hsh[j]
        count += ((jn-2)*(jn-1))/2 if jn >=3
      else
        jn,kn = hsh[i], hsh[j]
        count += jn*kn
      end
    end
  }
  count
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')
# fptr = File.open('test6')

nr = gets.rstrip.split

n = nr[0].to_i

r = nr[1].to_i

arr = gets.rstrip.split.map(&:to_i)

ans = countTriplets arr, r

p ans

p exp = gets.chomp.to_i

puts "#{ans-exp} diff"

# fptr.write ans
# fptr.write "\n"
#
# fptr.close()

