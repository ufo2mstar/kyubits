def is_palin str
  len = str.length
  is_palin_util str, 0, len - 1
end

def is_palin_util(str, l, r)
  if l > r
    true
  else
    str[l] == str[r] ? is_palin_util(str, l + 1, r - 1) : false
  end
end
