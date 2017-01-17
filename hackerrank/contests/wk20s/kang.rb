#!/bin/ruby

x1, v1, x2, v2 = gets.strip.split(' ')
x1 = x1.to_i
v1 = v1.to_i
x2 = x2.to_i
v2 = v2.to_i


def check x1, v1, x2, v2
  is_in_line= -> start, rate, term { term > start and term%rate == 0 }
  if (x1>x2 and v1>v2) or (x2>x1 and v2>v1)
    return "NO"
  else
    while term < 1e4
      return "YES" if (is_in_line[x1, v1, term] and is_in_line[x2, v2, term])
      term += prod
    end
    return "NO"
  end
end

puts ((x1>x2 and v1>v2) or (x2>x1 and v2>v1) or (v1==v2 and x1!=x2 )or (x1-x2-v1+v2) % (v2-v1) != 0 )? "NO" : "YES"

