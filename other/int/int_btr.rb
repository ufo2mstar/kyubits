require 'set'

def brackets n
  @set = Set.new
  build n, n, ""
  @set
end


def build str, beg, fin
  build str+"(", beg-1, fin if beg > 0
  build str+")", beg, fin-1 if fin > beg
  @set << str if beg == 0 and fin == 0
end

n = 10
puts brackets(n).to_a
