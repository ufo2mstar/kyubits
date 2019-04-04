# Find Smallest Letter Greater Than Target
# Go to Discuss
# Given a list of sorted characters letters containing only lowercase letters, and given a target letter target, find the smallest element in the list that is larger than the given target.
#
#     Letters also wrap around. For example, if the target is target = 'z' and letters = ['a', 'b'], the answer is 'a'.
#
#         Examples:
#         Input:
#         letters = ["c", "f", "j"]
#     target = "a"
#     Output: "c"
#
#     Input:
#         letters = ["c", "f", "j"]
#     target = "c"
#     Output: "f"
#
#     Input:
#         letters = ["c", "f", "j"]
#     target = "d"
#     Output: "f"
#
#     Input:
#         letters = ["c", "f", "j"]
#     target = "g"
#     Output: "j"
#
#     Input:
#         letters = ["c", "f", "j"]
#     target = "j"
#     Output: "c"
#
#     Input:
#         letters = ["c", "f", "j"]
#     target = "k"
#     Output: "c"
#     Note:
#         letters has a length in range [2, 10000].
#         letters consists of lowercase letters, and contains at least 2 unique letters.
#         target is a lowercase letter.
#

# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)

end

def bin letters, target
  l, r = 0, letters.size
  mid = nil
  while l < r
    mid = l + (r - l) / 2
    if letters[mid] == target
      break
    else
      if mid < val(target)
        l = mid + 1
      else
        r = mid
      end
    end
  end
end

def diff c, q
  val = -> x {x.ord - 97}
  [(val[q] - val[c]).abs, 26 - (val[q] - val[c]).abs].min
end

# def val x
#   x.ord - 97
# end
