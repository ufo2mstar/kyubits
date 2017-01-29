# #!/bin/ruby
#
# s = gets.strip
# n = gets.strip.to_i
#
# def make_ary(s)
#   ary = []
#   prev = ''
#   prev_n = 0
#   s.chars do |c|
#     n = c.ord - 96
#     n+= prev_n if prev == c
#     ary << n
#     prev_n = n
#     prev = c
#   end
#   ary
# end
#
# a = make_ary s
# #puts a
# for a0 in (0..n-1)
#   x = gets.strip.to_i
#   # your code goes here
#   puts(a.include?(x) ? "Yes" : "No")
# end

#!/bin/ruby

s = gets.strip
n = gets.strip.to_i

def make_hsh(s)
  hsh = {}
  prev = ''
  prev_n = 0
  s.chars do |c|
    n = c.ord - 96
    n+= prev_n if prev == c
    hsh[n.to_s] = true
    prev_n = n
    prev = c
  end
  hsh
end

a = make_hsh s
#puts a
for a0 in (0..n-1)
  x = gets.strip
  # your code goes here
  puts(a[x] ? "Yes" : "No")
end
