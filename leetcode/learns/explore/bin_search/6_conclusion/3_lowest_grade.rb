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
  # next_greatest_letter_64(letters, target)
  next_greatest_letter_44(letters, target)
  # next_greatest_letter_48(letters, target)
  # next_greatest_letter_52(letters, target)
  # next_greatest_letter_56(letters, target)
end


# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter_64(letters, target)
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
      r = mid + 1
      break
      # return ary[mid]
    else
      ary[mid] > x ? (r = mid - 1) : (l = mid + 1)
    end
  end
  # n = ary[l] > x ? r : r + 1
  v = [l, r].max
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


# ans:
#
# sample 44 ms submission
#
# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter_44(letters, target)
  letters.bsearch {|l| l > target} || letters.min
end


# sample 48 ms submission
#
# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter_48(letters, target)
  array = "abcdefghijklmnopqrstuvwxyz".split("")
  min = 0
  max = letters.length - 1
  while min <= max
    mid = min + (max - min) / 2
    if letters[mid] == target
      min = mid + 1
      if letters[max] == target
        min = max + 1
        break
      end
    elsif array.index(letters[mid]) <= array.index(target)
      min = mid + 1
    else
      max = mid - 1
    end
  end
  letters[min % letters.length]
end

# sample 52 ms submission
#
# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter_52(l, t)
  l.uniq!
  i = l.bsearch_index {|x| x >= t}
  if i.nil?
    l[0]
  elsif l[i] != t
    l[i]
  else
    l[(i + 1) % l.size]
  end
end


# sample 56 ms submission
# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter_56(letters, target)
  left = 0
  right = letters.size - 1
  while (left + 1 < right)
    mid = (left + right) / 2
    # p "left #{left} right #{right} mid #{mid}"
    # if (letters[mid-1] <= target && letters[mid+1] > target)
    #   return letters[mid]
    if letters[mid] <= target
      left = mid
    else
      right = mid
    end
  end
  # puts "skonczylo sie na left #{left} i right #{right}"

  return letters[left + 1] if letters[left] <= target && letters[right] > target
  return letters[0] if letters[right] <= target
  return letters[left]
end
