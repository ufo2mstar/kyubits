
#== some small error in this one
# #!/bin/ruby
#
# n,c,m = gets.strip.split(' ')
# n = n.to_i
# c = c.to_i
# m = m.to_i
# p = gets.strip
# p = p.split(' ').map(&:to_i)
#
# tots = p.reduce(&:+)
# cap = m * c * n
# max = p.max
# one_trip_max = c * m
#
# puts ((tots <= cap)and(max <= one_trip_max) ? "Yes" : "No")


# == dangit! bracket error

#!/bin/ruby

n,c,m = gets.strip.split(' ')
n = n.to_i
c = c.to_i
m = m.to_i
p = gets.strip
p = p.split(' ').map(&:to_i)

tots = p.reduce(&:+)
cap = m * c * n
max = p.max
one_trip_max = c * m

puts ((max <= one_trip_max) and (tots <= cap)) ? "Yes" : "No"