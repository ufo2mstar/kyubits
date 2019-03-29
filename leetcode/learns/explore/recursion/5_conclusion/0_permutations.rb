def permute_helper_chomp str, prefix
  if str.empty?
    puts prefix
  else
    (str.length).times do |i|
      # append to prefix
      c = str[i]
      prefix += c
      new_str = str.delete(c)
      # explore
      permute_helper_chomp new_str, prefix
      # prepend
      prefix.chomp
    end
  end
end

def permute_helper_swap_counter str, l, r, count
  if l == r
    puts str
    @count+=1
  else
    (l...r).each do |i|
      # swap i and l
      swap str, i, l
      # explore l+1 to end
      permute_helper_swap_counter str, l + 1, r, count
      # swap l and i back
      swap str, l, i
    end
  end
end

def permute_helper_swap str, l, r
  if l == r
    puts str
  else
    (l...r).each do |i|
      # swap i and l
      swap str, i, l
      # explore l+1 to end
      permute_helper_swap str, l + 1, r
      # swap l and i back
      swap str, l, i
    end
  end
end

def swap str, i, j
  str[i], str[j] = str[j], str[i]
end

def permute str
  # # new str perm
  # permute_helper_chomp str, ""
  # # swap test
  # permute_helper_swap str, 0, str.length, count
  # with counter
  @count = 0
  permute_helper_swap_counter str, 0, str.length, @count
  puts @count
end


# permute "abcd"
permute "abcd123"
