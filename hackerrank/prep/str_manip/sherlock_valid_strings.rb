#!/bin/ruby

require 'json'
require 'stringio'

# Complete the isValid function below.
def isValid(s)
  code_counts = get_counts_hash s.chars
  freq_counts = get_counts_hash code_counts.values
  delta =-> ary {ary.max - ary.min}
  # puts str_counts
  res = (freq_counts.size == 1 or
      (freq_counts.size == 2 and
        (freq_counts[1]==1) or (freq_counts.values.min == 1 and
      (delta[freq_counts.keys]==1 and
          (freq_counts[freq_counts.keys.max] == 1 or freq_counts[freq_counts.keys.max] - freq_counts[freq_counts.keys.min] == 1 ))))) ? "YES" : "NO"
  # [code_counts, freq_counts.values, freq_counts, freq_counts.size == 1, freq_counts.size == 2, freq_counts.values.min == 1, delta[freq_counts.keys], res]
end

def get_counts_hash ary
  str_counts = {}
  str_counts.default = 0
  ary.each {|c| str_counts[c]+=1}
  str_counts
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')
#
# s = gets.to_s.rstrip
#
# result = isValid s
#
# fptr.write result
# fptr.write "\n"
#
# fptr.close()


strs = []

strs << 'a' # yes

strs << 'ibfdgaeadiaefgbhbdghhhbgdfgeiccbiehhfcggchgghadhdhagfbahhddgghbdehidbibaeaagaeeigffcebfbaieggabcfbiiedcabfihchdfabifahcbhagccbdfifhghcadfiadeeaheeddddiecaicbgigccageicehfdhdgafaddhffadigfhhcaedcedecafeacbdacgfgfeeibgaiffdehigebhhehiaahfidibccdcdagifgaihacihadecgifihbebffebdfbchbgigeccahgihbcbcaggebaaafgfedbfgagfediddghdgbgehhhifhgcedechahidcbchebheihaadbbbiaiccededchdagfhccfdefigfibifabeiaccghcegfbcghaefifbachebaacbhbfgfddeceababbacgffbagidebeadfihaefefegbghgddbbgddeehgfbhafbccidebgehifafgbghafacgfdccgifdcbbbidfifhdaibgigebigaedeaaiadegfefbhacgddhchgcbgcaeaieiegiffchbgbebgbehbbfcebciiagacaiechdigbgbghefcahgbhfibhedaeeiffebdiabcifgccdefabccdghehfibfiifdaicfedagahhdcbhbicdgibgcedieihcichadgchgbdcdagaihebbabhibcihicadgadfcihdheefbhffiageddhgahaidfdhhdbgciiaciegchiiebfbcbhaeagccfhbfhaddagnfieihghfbaggiffbbfbecgaiiidccdceadbbdfgigibgcgchafccdchgifdeieicbaididhfcfdedbhaadedfageigfdehgcdaecaebebebfcieaecfagfdieaefdiedbcadchabhebgehiidfcgahcdhcdhgchhiiheffiifeegcfdgbdeffhgeghdfhbfbifgidcafbfcd'
# yes

strs << 'aabbcd'
# no

strs << 'aaaaabc'
# NO

strs << 'abcdefghhgfedecba'
# yes

strs << 'aabbccddeefghi'
# NO

strs.each{|str|
puts isValid str
}
