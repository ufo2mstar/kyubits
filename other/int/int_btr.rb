require 'set'

def brackets n
  @set = Set.new
  ary = []
  build "", n, n, ary
  ary
  @set
  [@set, ary]
end


def build str, beg, fin, ary
  build str+"(", beg-1, fin, ary if beg > 0
  build str+")", beg, fin-1, ary if fin > beg
  @set << str if beg == 0 and fin == 0
  ary << str if beg == 0 and fin == 0
end

# n = 15 # dont go over!
# n = 13 # 742900
# n = 12 # 208012
# n = 11 # 58786
n = 10 # 16796
# puts brackets(n).to_a
# puts brackets(n)[1]
puts brackets(n)[0].size
puts brackets(n)[1].size
