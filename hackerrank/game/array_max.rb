#!/bin/ruby

g = gets.strip.to_i
for a0 in (0..g-1)
  n = gets.strip.to_i
  a = gets.split(' ').map(&:to_i)
  bob_wins = true
  loop do
    max_i = a.index(a.max)
    break if max_i == 0
    bob_wins = !bob_wins
    a = a[0..max_i-1]
  end
  puts bob_wins ? "BOB" : "ANDY"
end
