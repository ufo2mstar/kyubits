# https://www.hackerrank.com/challenges/save-humanity

# Enter your code here. Read input from STDIN. Print output to STDOUT

tests = gets.chomp.to_i

make_errs=-> str { res = []; str.length.times{|i| s = str.dup; s[i]='.'; res << s};res}


tests.times do
  patient,virus = gets.chomp.split ' '

  matches = []
  p errs = make_errs[virus]
  # errs << virus # i think the other cases cover this as well!
  n = patient.length - virus.length + 1

  n.times do |i|
    patient[/(#{check})/]
  end
  puts matches.join ' '
end


# Naive algo

# works, but better one needed!

tests = gets.chomp.to_i

make_errs=-> str { res = []; str.length.times{|i| s = str.dup; s[i]='.'; res << s};res}


tests.times do
  patient,virus = gets.chomp.split ' '

  matches = []
  errs = make_errs[virus]
  # errs << virus # i think the other cases cover this as well!
  vir_len = virus.length
  n = patient.length - vir_len + 1

  errs_str = errs.join('|')
  n.times do |i|
    check = errs_str
    if patient[i..i+vir_len-1][/(#{check})/,1]
      matches << i
      #p i, patient[i..i+vir_len],patient[i..i+vir_len][/(#{check})/,1]
      next
    end

  end

  puts(matches.empty? ? "No Match!" : matches.join(' '))
end

