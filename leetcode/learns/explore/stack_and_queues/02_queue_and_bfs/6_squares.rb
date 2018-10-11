# Perfect Squares
# Go to Discuss
# Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
#
#     Example 1:
#
#     Input: n = 12
# Output: 3
# Explanation: 12 = 4 + 4 + 4.
#         Example 2:
#
#     Input: n = 13
# Output: 2
# Explanation: 13 = 4 + 9.

# @param {Integer} n
# @return {Integer}
def all_possible_counts_squares(n)
  range = Math.sqrt(n).floor
  ary = (1..range).map {|x| x**2}
  q = [[0, 0]]
  count = 0
  until q.empty? do
    x, old_sum = q.shift
    # puts "#{x} + #{old_sum}"
    sum = x + old_sum
    next if sum > n
    (count+=1; next) if sum == n
    ary.each {|y| q << [y, sum]}
    # p q
  end
  count
end

n=12

puts all_possible_counts_squares n


# @param {Integer} n
# @return {Integer}
def slow_num_squares(n)
  range = Math.sqrt(n).ceil
  mem = {}
  ary = (1..range).map {|x| x**2}
  q = [[0, 0, 0]]
  count = 0
  until q.empty? do
    x, old_sum, min = q.shift
    # puts "#{x} + #{old_sum}"
    sum = x + old_sum
    next if sum > n
    return min if sum == n
    ary.each {|y| q << [y, sum, min+1] unless mem[sum]}
    # mem[sum] = true
    p q.size
  end
  count
end


# @param {Integer} n
# @return {Integer}
def num_squares(n)
  range = Math.sqrt(n).ceil
  mem = {}
  ary = (1..range).map {|x| x**2}
  q = ary.clone
  count = 0
  # q is of sums not each possible nums!!
  until q.empty? do
    count+=1
    new_q = []
    q.each {|x|
      # puts "#{x} + #{old_sum}"
      ary.each {|y|
        sum = x + y
        next if sum > n
        return count+1 if sum == n
        new_q << sum unless mem[sum]
        mem[sum] = true
      }
      p new_q.size
    }
    q = new_q
  end
  count
end

n=12
n= 7168

puts num_squares n


# todo: https://leetcode.com/problems/perfect-squares/discuss/71488/Summary-of-4-different-solutions-(BFS-DP-static-DP-and-mathematics)
