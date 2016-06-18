# Enter your code here. Read input from STDIN. Print output to STDOUT

# str1 = gets.chomp
# str2 = gets.chomp

str1,str2 = %w{bacdc dcbad}
str1,str2 = %w{cde abc}

s1c,s2c = str1.chars,str2.chars


del = -> ary1o,ary2o { ary1,ary2 = ary1o.dup,ary2o.dup; ary1.each{ |x| ary2.delete_at(ary2.index(x)) if ary2.index(x)}; puts ary2;puts; ary2.size}
# puts (s1c)
# puts (s2c)
# puts del[s1c,s2c]
# puts del[s2c,s1c]

puts del[s1c,s2c] + del[s2c,s1c]