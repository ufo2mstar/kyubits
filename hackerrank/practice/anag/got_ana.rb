# Enter your code here. Read input from STDIN. Print output to STDOUT

string = gets.chomp

found = 1; odds = 0
# Assign found a value of 1 or 0 depending on whether or not you found what you were looking for.
chars = string.chars.uniq
chars.each{|c| odds += 1 if string.count(c) % 2 != 0; (found=0;break) if odds > 1}


if found == 1
  puts "YES"
else
  puts "NO"
end
