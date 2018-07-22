# #!/bin/ruby
#
# require 'json'
# require 'stringio'
#
# # Complete the substrCount function below.
# def substrCount(n, s)
#   # palins_ary = []
#   palins_ary_count = 0
#   for len in 0..n
#     head = 0
#     tail = head + len
#     while tail < n
#       sub_str = s[head..tail]
#       # palins_ary << sub_str if isPalindrome sub_str
#       palins_ary_count+=1 if isPalindrome sub_str
#       head+=1
#       tail = head + len
#     end
#   end
#   # [palins_ary,palins_ary.count]
#   palins_ary_count
# end
#
# def isPalindrome s
#   ary = s.chars
#   return false if ary.empty?
#
#   ary.slice! ary.size/2 if ary.size % 2 != 0
#   idx = ary.size/2 - 1
#
#   spl_str = ary[idx]
#   while idx >= 0
#     return false if spl_str != ary[ary.size-1-idx]
#     idx-=1
#   end
#
#   return true
# end
#
# fptr = File.open(ENV['OUTPUT_PATH'], 'w')
#
# n = gets.to_i
#
# s = gets.to_s.rstrip
#
# result = substrCount n, s
#
# fptr.write result
# fptr.write "\n"
#
# fptr.close()

#!/bin/ruby

require 'json'
require 'stringio'

# Complete the substrCount function below.
def substrCount(n, s)
  palins_ary_count = 0

  summ=-> n {(n*(n+1))/2}
  char_ary, freq_ary = get_freq_dist s
  char_ary.each_with_index{|c,i|
    palins_ary_count+= summ[freq_ary[i]]
    unless i==0 or i==n
      if char_ary[i-1] == char_ary[i+1]
        n = [freq_ary[i+1],freq_ary[i-1]].min
        # palins_ary_count+= summ[n]
        palins_ary_count+= n
      end
    end
  }

  palins_ary_count
end

def get_freq_dist(s)
  # return [[], []] if s.empty? # no need
  char_ary = []
  freq_ary = []
  last_chr = ""
  s.chars.each {|c|
    if last_chr != c
      char_ary << c
      freq_ary << 0
      last_chr = c
    end
    freq_ary[-1]+=1
  }
  [char_ary, freq_ary]
end


# fptr = File.open(ENV['OUTPUT_PATH'], 'w')
#
# n = gets.to_i
#
# s = gets.to_s.rstrip
#
# result = substrCount n, s
#
# fptr.write result
# fptr.write "\n"
#
# fptr.close()


# Complete the substrCount function below.
def substrCount2(n, s)
  # palins_ary = []
  palins_ary_count = 0
  for len in 0..n
    head = 0
    tail = head + len
    while tail < n
      sub_str = s[head..tail]
      # palins_ary << sub_str if isPalindrome sub_str
      palins_ary_count+=1 if isPalindrome sub_str
      head+=1
      tail = head + len
    end
  end
  # [palins_ary,palins_ary.count]
  palins_ary_count
end

def isPalindrome s
  ary = s.chars
  return false if ary.empty?

  ary.slice! ary.size/2 if ary.size % 2 != 0
  idx = ary.size/2 - 1

  spl_str = ary[idx]
  while idx >= 0
    return false if spl_str != ary[ary.size-1-idx]
    idx-=1
  end

  return true
end

str = "ccacacabccacabaaaabbcbccbabcbbcaccabaababcbcacabcabacbbbcccc"

# exp = 1272919
# got = 1398176
puts substrCount str.size,str
puts substrCount2 str.size,str
