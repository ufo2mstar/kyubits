# 4Sum II
# Go to Discuss
# Given four lists A, B, C, D of integer values, compute how many tuples (i, j, k, l) there are such that A[i] + B[j] + C[k] + D[l] is zero.
#
#     To make problem a bit easier, all A, B, C, D have same length of N where 0 ≤ N ≤ 500. All integers are in the range of -228 to 228 - 1 and the result is guaranteed to be at most 231 - 1.
#
#     Example:
#
#     Input:
#     A = [ 1, 2]
# B = [-2,-1]
# C = [-1, 2]
# D = [ 0, 2]
#
# Output:
#     2
#
# Explanation:
#     The two tuples are:
#                        1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
# 2. (1, 1, 0, 0) -> A[1] + B[1] + C[0] + D[0] = 2 + (-1) + (-1) + 0 = 0

# 100 percentile again! why will this form not come in interviews.. god, I only hope!!

# @param {Integer[]} a
# @param {Integer[]} b
# @param {Integer[]} c
# @param {Integer[]} d
# @return {Integer}
def four_sum_count(a, b, c, d)
  ab = Hash.new(0)
  count = 0
  a.each{|ae|b.each{|be| ab[ae+be]+=1}}
  c.each{|ce|d.each{|de| count+=ab[-(ce+de)]}}
  count
end
