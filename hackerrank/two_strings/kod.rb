# Enter your code here. Read input from STDIN. Print output to STDOUT
def kyu_two_strings str1, str2
  str1ary = ('a'..'z').to_a
  26.times do |i|
    st1 = str1ary[i]
    return "YES" if str1[/(#{st1})/, 1] and str2[/(#{st1})/, 1]
    "NO"
  end
end

t = gets.chomp.to_i
t.times { |i|
  str1, str2= gets.chomp, gets.chomp
  puts kyu_two_strings(str1, str2)
}