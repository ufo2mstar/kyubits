# Pascal's Triangle II
#   Go to Discuss
# Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
#
#     Note that the row index starts from 0.
#
#
#         In Pascal's triangle, each number is the sum of the two numbers directly above it.
#
# Example:
#
# Input: 3
# Output: [1,3,3,1]
# Follow up:
#
# Could you optimize your algorithm to use only O(k) extra space?

# @param {Integer} row_index
# @return {Integer[]}
def get_row(r)
  @pasc = Array.new(r) {Array.new(r)}
  ans = []
  r.times{|i| ans << rec(r,i)}
  ans
end

def rec i,j
  p [i,j]
  return @pasc[i][j] if @pasc[i][j]
  (return @pasc[i][j] = 1) if j == 0 or j == i
  return rec(i-1,j-1) + rec(i-1,j)
end

r = 3
p get_row(r)
