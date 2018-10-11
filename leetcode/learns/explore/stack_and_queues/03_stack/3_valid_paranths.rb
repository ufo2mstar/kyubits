# Valid Parentheses
# Go to Discuss
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
#     An input string is valid if:
#
#                                  Open brackets must be closed by the same type of brackets.
#     Open brackets must be closed in the correct order.
#     Note that an empty string is also considered valid.
#
#         Example 1:
#
#     Input: "()"
# Output: true
# Example 2:
#
#     Input: "()[]{}"
# Output: true
# Example 3:
#
#     Input: "(]"
# Output: false
# Example 4:
#
#     Input: "([)]"
# Output: false
# Example 5:
#
#     Input: "{[]}"
# Output: true


# @param {String} s
# @return {Boolean}
def is_valid(s)
  stk = []
  match = {"}" => "{","]" => "[",")" => "("}
  return false if s.chars.size % 2 != 0
  s.chars.each do |b|
    if match[b]
      if stk.last == match[b]
        stk.pop
      else
        return false
      end
    else
      stk << b
    end
  end
  stk.empty?
end
