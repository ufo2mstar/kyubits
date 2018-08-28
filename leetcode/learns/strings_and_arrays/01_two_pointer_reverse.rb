# Write a function that takes a string as input and returns the string reversed.
#
#     Example 1:
#
#     Input: "hello"
# Output: "olleh"
# Example 2:
#
#     Input: "A man, a plan, a canal: Panama"
# Output: "amanaP :lanac a ,nalp a ,nam A"

# @param {String} s
# @return {String}
def reverse_string(s)
  ary = s.chars
  res = []
  i = 0; j = ary.size-1
  while(i<=j) do
    res[j],res[i] = [ary[i],ary[j]]
    i+=1
    j-=1
  end
  res.join
end
