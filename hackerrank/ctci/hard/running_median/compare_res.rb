puts "EXP \t - \t Res"

File.open('test_res.txt', 'r') do |f|
  puts "#{f.readline} \t - \t #{gets.strip.to_i}"
end