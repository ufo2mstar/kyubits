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
  letters.uniq!
  n = letters.size - 1
  return if n <= 0
  letters[0] if target <= letters[0]
  letters[0] if target >= letters[n]
  bin_search_right letters, 0, n, target
end

def bin_search_right ary, l, r, x
  mid = 0
  while l < r
    mid = l + (r - l) / 2
    if ary[mid] == x
      r = mid+1
      break
      # return ary[mid]
    else
      ary[mid] > x ? (r = mid - 1) : (l = mid+1)
    end
  end
  # n = ary[l] > x ? r : r + 1
  v = [l,r].max
  # v = mid
  n = ary[v] > x ? v : v + 1
  n >= ary.size ? ary[0] : ary[n]
end


# def bin letters, target
#   l, r = 0, letters.size
#   mid = nil
#   while l < r
#     mid = l + (r - l) / 2
#     if letters[mid] == target
#       break
#     else
#       if mid < val(target)
#         l = mid + 1
#       else
#         r = mid
#       end
#     end
#   end
# end
#
# def diff c, q
#   val = -> x {x.ord - 97}
#   [(val[q] - val[c]).abs, 26 - (val[q] - val[c]).abs].min
# end

# def val x
#   x.ord - 97
# end
