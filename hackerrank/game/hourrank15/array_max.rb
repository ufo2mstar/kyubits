# trivial timeout
#!/bin/ruby

g = gets.strip.to_i
for a0 in (0..g-1)
  n = gets.strip.to_i
  a = gets.split(' ').map(&:to_i)
  bob_wins = true
  loop do
    max_i = a.index(a.max)
    break if max_i == 0
    bob_wins = !bob_wins
    a = a[0..max_i-1]
  end
  puts bob_wins ? "BOB" : "ANDY"
end






# max skip fail

#!/bin/ruby

g = gets.strip.to_i
for a0 in (0..g-1)
  n = gets.strip.to_i
  a = gets.split(' ').map(&:to_i)
  sort_a = a.sort
  a_max = a.max
  n_th = 0
  a.each{|x|n_th+=1 if x>a[0]; break if x == a_max}
  bob_wins = n_th % 2 == 0
  puts bob_wins ? "BOB" : "ANDY"
end
