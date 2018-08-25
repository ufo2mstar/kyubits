#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumBribes function below.
def minimumBribes(q)
  bribe_count = 0
  q.each_with_index do |person,i|
    position = i+1
    offset = person - position

    if offset > 2
      puts "Too chaotic"
      return
    elsif offset < 0
      # else
      if i < q.size-1
        overtake = person-q[i+1]
        bribe_count += 1 if overtake > 0
      end
      if i < q.size-2
        overtake = person-q[i+2]
        bribe_count += 2 if overtake > 0
      end
    else
      bribe_count += offset
    end
  end
  puts bribe_count
end

t = gets.to_i

t.times do |t_itr|
  n = gets.to_i

  q = gets.rstrip.split(' ').map(&:to_i)

  minimumBribes q
end
