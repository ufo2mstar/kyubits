def bmh_table str
  len = str.length
  res = {"?" => len}
  (len-1).times do |i|
    res[str[i]] = len - i - 1
  end
  res
end

def bmh_search text, match, skip_limit = 0, &blk
  table = bmh_table match
  match_limit = match.length
  text_limit = text.length
  # search_len = text_limit - match_limit + 1
  curr = match_limit - 1
  matches = []
  # puts "#{"0123456789" * (text_limit / 9) }\n#{text}\n#{match}\n#{skip_limit}"
  while curr < text_limit
    key = ""
    i=1
    skips = 0
    found = true # for found flag reset
    until i > match_limit
      char_match, char_text = match[-i], text[curr+1-i]
      if char_match != char_text
        skips += 1
        if skips > skip_limit
          # p "exiting at i = #{i} curr = #{curr} : #{ char_match } #{ char_text }"
          key = char_match
          found = false
          break
        end
      end
      i += 1
    end
    if found
      match_idx = curr+2-i
      matches << match_idx
      blk.call match_idx if blk
      curr += 1
      next
    end
    # curr += table[key] || table["?"]
    curr += 1
  end
  matches
end

puts bmh_table("TRUTH")
puts bmh_table("aaaabaaa")



p ,v = "123341234","1234"
p ,v = "abababaaaaabaaaaba","ababba"


mat = bmh_search p, v, 1
puts mat.join ' '