def is_palin str
  len = str.length
  # is_palin_util_rec str, 0, len - 1
  is_palin_util_itr str, 0, len - 1
end

def is_palin_util_rec(str, l, r)
  if l > r
    true
  else
    str[l] == str[r] ? is_palin_util(str, l + 1, r - 1) : false
  end
end

def is_palin_util_itr(str, l, r)
  until l > r
    if str[l] == str[r]
      l += 1; r -= 1
    else
      return false
    end
  end
  true
end
