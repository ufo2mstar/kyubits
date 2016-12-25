# #terrible impl.. totally din realize the stack ans
# t = gets.strip.to_i
# for a0 in (0..t-1)
#   expr = gets.strip
#   pairs = {
#       '{' => '}',
#       '(' => ')',
#       '[' => ']'
#   }
#   len = expr.length
#   mid = (len/2)-1
#   lefts,rights = pairs.keys,pairs.values
#   check=-> str,content { ((str.split('')-content).empty? ? true : false)}
#   (puts "NO";next) if expr.empty? or (len % 2 != 0) or !check[expr,lefts+rights]
#   (puts "NO";next) unless check[expr[0..mid],lefts] and check[expr[mid+1..len-1],rights]
#   pairs.merge! pairs.invert
#   inv = expr.reverse.split('').map{|itm| pairs[itm]}.join
#   puts(inv == expr ? "YES" : "NO")
# end

# stack try.. whi is this failint!?!
#!/bin/ruby

t = gets.strip.to_i
for a0 in (0..t-1)
  expr = gets.strip
  pairs = {
      '{' => '}',
      '(' => ')',
      '[' => ']'
  }
  len = expr.length
  (puts "NO";next) if (len % 2 != 0)
  residue = []
  expr.split('').each { |char| puts residue[-1];residue[-1] == pairs[char] ? residue.delete_at(-1) : residue << char}
  p residue
  puts(residue.empty? ? "YES" : "NO")
end


# btr stack?

t = gets.strip.to_i
for a0 in (0..t-1)
  expr = gets.strip
  pairs = {
      '{' => '}',
      '(' => ')',
      '[' => ']'
  }
  inv_pairs = pairs.invert
  lefts, rights = pairs.keys, pairs.values
  len = expr.length
  (puts "NO"; next) if (len % 2 != 0)
  residue = []
  expr.split('').each { |char| lefts.include?(char) ? residue << char : (residue[-1] == inv_pairs[char] ? residue.delete_at(-1) : break) }
  puts(residue.empty? ? "YES" : "NO")
end

