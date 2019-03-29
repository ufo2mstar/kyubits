


def permute_helper str, prefix
  if str.empty?
    print prefix
  else
    # append to prefix
    c = str[0]
    prefix += c
    # explore
    permute_helper str[1..-1], prefix
    # prepend
    prefix.chomp
  end
end


def permute str
  permute_helper str, ""
end


permute "ruby"
