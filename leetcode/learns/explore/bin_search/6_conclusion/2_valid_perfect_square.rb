# Valid Perfect Square
# Go to Discuss
# Given a positive integer num, write a function which returns True if num is a perfect square else False.
#
#     Note: Do not use any built-in library function such as sqrt.
#
#     Example 1:
#
#     Input: 16
# Output: true
# Example 2:
#
#     Input: 14
# Output: false

# @param {Integer} num
# @return {Boolean}
def is_perfect_square(x)
  bin1(x) != -1
end

def bin1(x)
  left,right = 0,x
  while left <= right
    mid = (left+right)/2
    sq = mid*mid
    if sq == x
      return mid
    else
      if sq < x
        left = mid+1
      else
        right = mid-1
      end
    end
  end
  -1
end
