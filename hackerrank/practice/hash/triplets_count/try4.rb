#!/bin/ruby

require 'json'
require 'stringio'

def countTriplets(arr, r)
  v2 = {}
  v3 = {}
  v3.default = 0
  v2.default = 0
  count = 0
  for k in arr
    count += v3[k]
    v3[k*r] += v2[k]
    v2[k*r] += 1
    puts "#{k} - count: #{count} - v2: #{v2} - v3: #{v3}"
  end
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

