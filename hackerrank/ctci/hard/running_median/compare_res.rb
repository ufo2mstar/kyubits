p 100.times.map{|i| (i-1)/2 }
#!/bin/ruby

n = gets.strip.to_i
a = Array.new(n)
get_median=-> ary, len { len.even? ? (ary[len/2]+ary[(len-2)/2])/2.0 : ary[((len-1)/2)] }

for a_i in (0..n-1)
  a[a_i] = gets.strip.to_i
  a[0..a_i] = a[0..a_i].sort
  puts get_median[a, a_i+1].to_f
end

puts "EXP \t - \t Res"

File.open('test_res.txt', 'r') do |f|
  f.readlines.each { |line| puts "#{line.strip} \t - \t #{gets.strip}" }
end