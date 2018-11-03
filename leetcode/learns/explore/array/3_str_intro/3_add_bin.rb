# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  t = [a.size,b.size].max
  res = []
  c,d = 0,nil
  ae,be = a.size-1,b.size-1
  t.times do |i|
    x = a[ae-i]
    y = b[be-i]
    p "#{x}, #{y}, #{c}.."
    c,d = add x,y,c
    p "c = #{c}, d = #{d}.."
    res.unshift d
    p res
  end
  res.unshift c if c
  res.reverse.join
end

def add x,y,c
  # p "kod! #{x}, #{y}, #{c}.."
  if x == "1" and y == "1" and c == '1'
    [1,1]
  elsif ((x == "1" and y == "0") or (x == "0" and y == "1"))
    if c == "1"
      [1,0]
    elsif c == "0"
      [0,1]
    end
  elsif x == "1" and y == "1" and c == '0'
    [1,0]
  elsif x == "0" and y == "0" and c == '0'
    [0,0]
  elsif x.nil? and y.nil?
    p "should not get here"
  elsif x.nil?
    [0,y]
  elsif y.nil?
    [0,x]
  else
    p "kod! #{x}, #{y}, #{c}.."
    [-1,-1]
  end
end

a= "11"
b="10"

p add_binary a,b
