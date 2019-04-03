# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
  find_n_k n, k, {}
end

def find_n_k n, k, cache
  return 0 if n == 1 and k == 1
  # return 0 if n == 2 and k == 1
  # return 1 if n == 2 and k == 2
  if cache[[n, k]]
    cache[[n, k]]
  elsif k > 2 ** (n - 1)
    # puts "error k = #{k} while n = #{n} (greater than 2 ^ (n - 1) = #{2 ** (n - 1)}"
    # p "kod"
  elsif k > 2 ** (n - 2)
    # puts "k = #{k} while n = #{n} (greater than 2 ^ (n - 2) = #{2 ** (n - 2)}"
    # cache[[n, k]] ||= flip(find_n_k n, k % 2 ** (n - 2), cache)
    cache[[n, k]] ||= flip(find_n_k n, k - 2 ** (n - 2), cache)
  else
    cache[[n, k]] ||= (find_n_k(n - 1, k, cache))
  end
end

def flip x
  x == 0 ? 1 : 0
end


# p kth_grammar 4, 1
# p kth_grammar 4, 2
# p kth_grammar 4, 3
# p kth_grammar 4, 4
# p kth_grammar 4, 5
# p kth_grammar 4, 6
# p kth_grammar 4, 7
# p kth_grammar 4, 8
# p kth_grammar 4, 9


i = 10

i.times do |n|
  (2**(n+1)).times do |k|
    print kth_grammar n+1,k+1
  end
  puts
end


# sample 32 ms submission
# On the first row, we write a 0. Now in every subsequent row, we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.
#
# Given row N and index K, return the K-th indexed symbol in row N. (The values of K are 1-indexed.) (1 indexed).
#
# Examples:
# Input: N = 1, K = 1
# Output: 0
#
# Input: N = 2, K = 1
# Output: 0
#
# Input: N = 2, K = 2
# Output: 1
#
# Input: N = 4, K = 5
# Output: 1
#
# Explanation:
# row 1: 0
# row 2: 01
# row 3: 0110
# row 4: 01101001
# Note:
#
# N will be an integer in the range [1, 30].
# K will be an integer in the range [1, 2^(N-1)].

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar_32(_n, k)
  return 0 if k == 1
  r = 1
  loop do
    break if k <= 2
    r = 1 - r if k.even?
    k = (k / 2.0).ceil
  end
  r
end

p kth_grammar(4, 5)


# sample 44 ms submission
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar_44(n, k)
  (k - 1).to_s(2).count('1') % 2
end
