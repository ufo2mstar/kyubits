#!/bin/ruby

n = gets.strip.to_i
calories = gets.strip
calories = calories.split(' ').map(&:to_i)


res = 0
calories.sort.reverse.each_with_index{|c,i| x=(c * (2**i)); res += x}
puts res