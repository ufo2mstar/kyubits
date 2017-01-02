#!/bin/ruby

n = gets.strip.to_i
c = gets.strip
c = c.split(' ').map(&:to_i)
min = c.min
c_doub = c.dup
c_doub[c.index(min)] = 2 * min
doub_min = c_doub.min
ans = (doub_min>=min ? doub_min : min)
count = c.count{|x| x == min }
puts "#{ans} #{count}"


