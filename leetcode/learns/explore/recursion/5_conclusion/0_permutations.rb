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
      permute_helper new_str, prefix
      # prepend
      prefix.chomp
    end
  end
end

def permute_helper_swap str, prefix
  if str.empty?
    puts prefix
  else
    (str.length).times do |i|
      # append to prefix
      c = str[i]
      prefix += c
      new_str = str.delete(c)
      # explore
      permute_helper new_str, prefix
      # prepend
      prefix.chomp
    end
  end
end


def permute str
  # permute_helper_chomp str, ""
  permute_helper_swap str, ""
end


permute "ruby"
