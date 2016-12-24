num = gets.strip
max=0
num_str = num.to_s
k.times do |i|
  short_num = num_str[i..i+k].split.map(&:to_i)
  check = short_num.reduce(&:*)
  max = [max,check].max
end
puts max