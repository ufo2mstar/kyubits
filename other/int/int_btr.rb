require 'set'

def brackets n
  # @set = Set.new
  ary = []
  build "", n, n, ary
  ary
  # @set
end


def build str, beg, fin, ary
  build str+"(", beg-1, fin, ary if beg > 0
  build str+")", beg, fin-1, ary if fin > beg
  # @set << str if beg == 0 and fin == 0
  ary << str if beg == 0 and fin == 0
end

n = 10
puts brackets(n).to_a
