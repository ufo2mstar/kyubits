# Plus One
# Go to Discuss
# Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
#
#     The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
#
#     You may assume the integer does not contain any leading zero, except the number 0 itself.
#
#     Example 1:
#
#     Input: [1,2,3]
# Output: [1,2,4]
# Explanation: The array represents the integer 123.
#     Example 2:
#
#     Input: [4,3,2,1]
# Output: [4,3,2,2]
# Explanation: The array represents the integer 4321.

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  x=digits.size
  carry = 1
  x.times do |i|
    j = x-i-1
    n = digits[j] + carry
    carry = n / 10
    digits[j] = n % 10
  end
  carry == 1 ? digits.unshift(carry) : digits
end
