#!/bin/ruby

require 'json'
require 'stringio'

# Complete the freqQuery function below.
def freqQuery(queries)
  freq_map = {}
  count_map = {}
  freq_map.default = 0
  count_map.default = 0
  res = []
  queries.each do |q|
    type = q[0]
    num = q[1]
    case type
      when 1
        remove_from count_map, freq_map[num]-1 if freq_map[num] > 0
        add_to freq_map, num
        add_to count_map, freq_map[num]
      when 2
        remove_from freq_map, num
        remove_from count_map, freq_map[num]
        add_to count_map, freq_map[num]-1 if freq_map[num] > 1
      when 3
        res << (count_map[num] > 0 ? 1 : 0)
    end
  end
  res
end

def add_to hsh, num
  hsh[num] += 1 if hsh[num]
end

def remove_from hsh, num
  hsh[num] -= 1 if hsh[num] > 0
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

queries = Array.new(q)

q.times do |i|
  queries[i] = gets.rstrip.split.map(&:to_i)
end

ans = freqQuery queries

puts ans

# fptr.write ans.join "\n"
# fptr.write "\n"
#
# fptr.close()

