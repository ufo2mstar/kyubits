#!/bin/ruby

q = gets.strip.to_i
for a0 in (0..q-1)
    x = gets.strip.to_i
    bin = ("%b" % x).split('')
    len = bin.length-1
    sum = 0
    bin.each_with_index do |val,idx|
        sum+= 2**(len-idx) if val == '0'
    end
    puts sum
end