
def bin_permute n
  bin_permute_helper n, ""
end

def bin_permute_helper n, prefix
  if n == 0
    puts prefix
  else
    bin_permute_helper n - 1, prefix + "0"
    bin_permute_helper n - 1, prefix + "1"
  end
end



bin_permute 4
