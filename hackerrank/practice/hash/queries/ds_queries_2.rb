#!/bin/ruby

require 'json'
require 'stringio'

# Complete the freqQuery function below.
def freqQuery(queries)
  @freq_map = Hash.new {|h, k| h[k] = {}}
  @count_map = {}
  @count_map.default = 0
  res = []
  queries.each do |type, x|
    case type
    when 1
      add_to_ds x
    when 2
      remove_from_ds x
    when 3
      res << (@freq_map[x].size > 0 ? 1 : 0)
    else
      raise "whaaat??"
    end
  end
  res
end

def update_freq num, old_cnt, new_cnt
  @freq_map[old_cnt].delete num
  @freq_map[new_cnt][num] = true
end

def add_to_ds num
  old_cnt = @count_map[num]
  new_cnt = @count_map[num] += 1
  update_freq num, old_cnt, new_cnt
end

def remove_from_ds num
  old_cnt = @count_map[num]
  unless old_cnt <= 0
    new_cnt = @count_map[num] -= 1
    update_freq num, old_cnt, new_cnt
  end
end


# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.strip.to_i

queries = Array.new(q)

q.times do |i|
  queries[i] = gets.rstrip.split.map(&:to_i)
end

ans = freqQuery queries

f = open('test4ans')
exp = []
f.each_line { |line| exp << line.chomp.to_i }
f.close

puts "#\tExp\tAns"
(0...exp.size).each do|i|
  puts "#{i}\t#{exp[i]}\t#{ans[i]}" if exp[i] != ans[i]
end

#
# fptr.write ans.join "\n"
# fptr.write "\n"
#
# fptr.close()
