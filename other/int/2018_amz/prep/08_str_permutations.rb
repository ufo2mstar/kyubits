def perm str
  perm_rec str, 0, str.size-1
end

# def perm_rec str,l,r
#   str.each_chars do |c|
#     for
#       
#     end
#   end
# end
# 
# def swap str,c,i
#   return str if c == str[i]
#   str[i] = c
#   str
# end

# public static ArrayList<String> findPermutations(String str)
def unclean_find_permutations str
  # ArrayList<String> 
  permutations = []
  permutations << ""

# char [] 
  strArray = str.chars

# for (char c :
  strArray.each do |c|

    # ArrayList<String>
    tempList = []

    # for (String s :
    permutations.each do |s|
      # {
      for i in 0..s.length
        tempList << s[0...i] + c + s[i..s.length]

        # tempList << s+c
      end

      permutations = tempList
      # }
    end
  end

  # permutations.uniq
  permutations
end

def find_permutations str
  permutations = []
  permutations << ""

  str.each_char do |c|
    tempList = []
    permutations.each do |s|
      for i in 0..s.length
        res = s[0...i] + c + s[i..s.length]
        p res
        tempList << res
      end
      permutations = tempList
      p permutations
    end
  end
  permutations
end


p find_permutations "AB"
p find_permutations "ABC"
p find_permutations "ABCD"
p find_permutations "ABCDE"

def try_perm str


end
