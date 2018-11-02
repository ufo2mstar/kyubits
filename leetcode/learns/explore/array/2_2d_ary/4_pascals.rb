# Pascal's Triangle
#   Go to Discuss
# Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
#
#
#     In Pascal's triangle, each number is the sum of the two numbers directly above it.
#
# Example:
#
# Input: 5
# Output:
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]

# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  res = []
  num_rows.times do |row_i|
    row = []
    (row_i+1).times do |i|
      # p i
      if row_i == 0
        row << 1
      else
        prev = res[row_i-1]
        if i == 0 or i == row_i
          row << 1
        else
          row << prev[i] + prev[i-1]
        end
      end
    end
    res << row
    # p res
  end
  res
end
