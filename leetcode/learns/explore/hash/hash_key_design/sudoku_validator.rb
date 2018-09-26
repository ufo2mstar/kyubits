# Valid Sudoku
# Go to Discuss
# Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
#
#  Each row must contain the digits 1-9 without repetition.
#     Each column must contain the digits 1-9 without repetition.
#     Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
#
#     A partially filled sudoku which is valid.
#
#         The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
#
#             Example 1:
#
#     Input:
#     [
#         ["5","3",".",".","7",".",".",".","."],
#         ["6",".",".","1","9","5",".",".","."],
#         [".","9","8",".",".",".",".","6","."],
#         ["8",".",".",".","6",".",".",".","3"],
#         ["4",".",".","8",".","3",".",".","1"],
#         ["7",".",".",".","2",".",".",".","6"],
#         [".","6",".",".",".",".","2","8","."],
#         [".",".",".","4","1","9",".",".","5"],
#         [".",".",".",".","8",".",".","7","9"]
#     ]
# Output: true
# Example 2:
#
#     Input:
#     [
#         ["8","3",".",".","7",".",".",".","."],
#         ["6",".",".","1","9","5",".",".","."],
#         [".","9","8",".",".",".",".","6","."],
#         ["8",".",".",".","6",".",".",".","3"],
#         ["4",".",".","8",".","3",".",".","1"],
#         ["7",".",".",".","2",".",".",".","6"],
#         [".","6",".",".",".",".","2","8","."],
#         [".",".",".","4","1","9",".",".","5"],
#         [".",".",".",".","8",".",".","7","9"]
#     ]
# Output: false
# Explanation: Same as Example 1, except with the 5 in the top left corner being
# modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
# Note:
#
# A Sudoku board (partially filled) could be valid but is not necessarily solvable.
# Only the filled cells need to be validated according to the mentioned rules.
# The given board contain only digits 1-9 and the character '.'.
# The given board size is always 9x9.


# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  validate(board) and validate(board.transpose) and validate(blocks(board))
end

def validate curr_board
  curr_board.each{|vals|
    hsh = {}
    vals.each{|n|
      return false if hsh[n]
      hsh[n] = true unless n == "."
    }
  }
  true
end

def blocks board
  res = Array.new(9){Array.new(9){"."}}

  # offset = [0,3,6]
  map=-> n { n >= 6 ? 2 : n >= 3 ? 1 : 0}

  bucket = {
      "0,0" => 0,
      "0,1" => 1,
      "0,2" => 2,
      "1,0" => 3,
      "1,1" => 4,
      "1,2" => 5,
      "2,0" => 6,
      "2,1" => 7,
      "2,2" => 8,
  }

  for i in 0..8 do
    for j in 0..8 do
      i_buck, j_buck = map[i],map[j]
      bucket_num = bucket["#{i_buck},#{j_buck}"]
      res[bucket_num] << board[i][j]
    end
  end
  res
end
