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
  @pasc = Array.new(r+1) {Array.new(r+1)}
  ans = []
  (r+1).times{|i| ans << rec(r,i)}
  ans
end

def rec i,j
  # p [i,j]
  # p @pasc
  return @pasc[i][j] if @pasc[i][j]
  (return @pasc[i][j] = 1) if j == 0 or j == i
  return @pasc[i][j] = (rec(i-1,j-1) + rec(i-1,j))
end

r = 3
r = 4
r = 5
r = 15
r = 25
p get_row(r)

# sample 44 ms submission

# Given an index k, return the kth row of the Pascal's triangle.
#
# For example, given k = 3,
# Return [1,3,3,1].
#
# Note:
# Could you optimize your algorithm to use only O(k) extra space?

# @param {Integer} row_index
# @return {Integer[]}
def get_row4(row_index)
  res = [1]
  row_index.times do
    res = [[0] + res, res + [0]].transpose.map(&:sum)
  end
  res
end

p get_row(4)

# @param {Integer} row_index
# @return {Integer[]}
def get_row3(row_index)
  res = [1]
  row_index.times do
    res = [[0] + res, res + [0]].transpose.map(&:sum)
  end
  res
end

p get_row(4)

# sample 32 ms submission
# @param {Integer} row_index
# @return {Integer[]}
def get_row2(row_index)
  [p=1]+(1..row_index).map{|i|p=p*(row_index-i+1)/i}
end

# sample 36 ms submission
# @param {Integer} row_index
# @return {Integer[]}
def get_row1(row_index)
  [p=1]+(1..row_index).map{|i|p=p*(row_index-i+1)/i}
end

