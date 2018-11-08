# Given a string s and a string t, check if s is subsequence of t.
#
#     You may assume that there is only lower case English letters in both s and t. t is potentially a very long (length ~= 500,000) string, and s is a short string (<=100).
#
#     A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).
#
#     Example 1:
#     s = "abc", t = "ahbgdc"
#
# Return true.
#
#     Example 2:
#     s = "axc", t = "ahbgdc"
#
# Return false.
#
#     Follow up:
#                If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?
#
# Credits:
#     Special thanks to @pbrother for adding this problem and creating all test cases.


# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  # is_sub_recu s,t,s.size,t.size
  is_sub_itr s,t,s.size,t.size
  # is_sub_itr_rev s,t,s.size,t.size
end

def is_sub_recu s,t,sn,tn
  return true if sn == 0
  return false if tn == 0

  return is_sub s,t,sn-1,tn-1 if s[sn-1] == t[tn-1]
  return is_sub s,t,sn,tn-1
end

def is_sub_itr_rev s,t,sn,tn

  loop do
    return true if sn == 0
    return false if tn == 0

    if s[sn-1] == t[tn-1]
      sn-=1
      tn-=1
    else
      tn-=1
    end
  end
end


def is_sub_itr s,t,s_len,t_len
  return true if s_len == 0
  return false if t_len == 0
  sn,tn=0,0
  loop do
    return true if sn == s_len
    return false if tn == t_len

    sn+=1 if s[sn] == t[tn]
    tn+=1
  end
end
