require 'set'

def brackets n
  @set = Set.new
  return @set if n<=0
  @n = n
  recu "", n
  @set.to_a
end

def recu(str, rem)
  if rem > 0
    recu str+"(", rem-1
    recu str+")", rem unless is_balanced? str
    # recu str+")", rem if str.size.odd? # terrible
  else
    # while str.size < (2*@n)
    #   str+=")"
    # end
    str+=")" * ((2*@n)-str.size)
    @set << str
  end
end

def is_balanced? str
  stack = []
  str.chars.each {|c| c == "(" ? stack.push(c) : stack.pop}
  stack.empty?
end

i = 5
x = brackets i
puts x
puts x.size

# while i == 0
#   x = gets.chomp
#   brackets x.to_i
# end