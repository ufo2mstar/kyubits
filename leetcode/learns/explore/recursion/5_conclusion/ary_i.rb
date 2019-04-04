require 'pp'
ary = (1..4).to_a
ary.each_index { |i|
  pp left_trees = ary[0..i-1]
  pp right_trees = ary[i+1..-1]
}
