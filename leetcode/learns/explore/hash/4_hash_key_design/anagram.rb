# Group Anagrams
# Go to Discuss
# Given an array of strings, group anagrams together.
#
#     Example:
#
#     Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
#     Output:
#     [
#         ["ate","eat","tea"],
#         ["nat","tan"],
#         ["bat"]
#     ]
# Note:
#
#     All inputs will be in lowercase.
#     The order of your output does not matter.

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  # group_map = Hash.new()
  # group_map.default = []
  # https://stackoverflow.com/questions/30367487/creating-a-hash-with-values-as-arrays-and-default-value-as-empty-array
  group_map = Hash.new {|hsh, key| hsh[key] = []}

  strs.each {|str|
    key = make_key(str)
    group_map[key] << str
  }

  group_map.values
end

def make_key str
  min = 0
  max = 26
  count_list = Array.new(max, 0)

  offset = 97 # lower case alpha
  # offset = 65 # upper case alpha

  str.chars.each do |c|
    c = c.downcase
    idx = c.ord - offset
    if idx.between?(min, max)
      # puts "#{c} #{c.ord} #{idx}"
      count_list[idx] += 1
    end
  end
  count_list
end
