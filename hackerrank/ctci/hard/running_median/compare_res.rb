p 100.times.map{|i| (i-1)/2 }

puts "EXP \t - \t Res"

File.open('test_res.txt', 'r') do |f|
  f.readlines.each { |line| puts "#{line.strip} \t - \t #{gets.strip}" }
end