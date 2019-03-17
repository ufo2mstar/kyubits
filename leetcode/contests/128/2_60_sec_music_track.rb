# @param {Integer[]} time
# @return {Integer}
def num_pairs_divisible_by60_slow(time)
  return 0 if time.size <= 1
  i=0
  time.combination(2).each {|x|
    if (x[0]+x[1])%60==0
      # p x
      i+=1
    end
  }
  i
end

# @param {Integer[]} time
# @return {Integer}
def num_pairs_divisible_by60_all(time)
  return 0 if time.size <= 1
  i=0
  sums = Hash.new(0)
  kod = Hash.new{|h,k|h[k]=[]}
  time.combination(2).each {|a,b|
    if (a+b)%60==0
      # p x
      # p a+b
      sums[a+b]+=1
      kod[a+b] << [a,b]

      i+=1
    end
  }
  p sums
  p kod
  i
end

def fact(n)
  (1..n).inject(1) {|r, i| r*i}
end

def ncr(n, r)
  ;
  return 1 if n == 1
  fact(n)/(fact(r)*fact(n-r));
end

def num_pairs_divisible_by60_too_complex(time)
  hsh = Hash.new(0)
  time.each {|x| hsh[x]+=1}
  i = 0
  time.combination(2).each {|a, b|
    if (a+b)%60==0
      i+=ncr([hsh[a], hsh[b]].min, 2)
    end
  }
  i
end

def num_pairs_divisible_by60_min(time)
  return 0 if time.size < 1
  hsh = Hash.new(0)
  sums = Hash.new(0)
  kod = Hash.new{|h,k|h[k]=[]}
  time.each {|x| hsh[x]+=1}
  i = 0
  p hsh
  # p hsh.keys.sort.reverse
  hsh.keys.each do |a|
    sums[a] += hsh[a] if (a % 60 == 0 and hsh[a] > 1)
  end
  # p sums
  # p sums.keys.sort.reverse
  hsh.keys.combination(2).each {|a, b|
    # p [a,b,a+b]
    # sums[a] += hsh[a] if (a % 60 == 0 and sums[a] == 0 and hsh[a] > 1)
    # sums[b] += hsh[b] if (b % 60 == 0 and sums[b] == 0 and hsh[b] > 1)
    if (a+b)%60==0
      # p "#{a} #{b} #{a+b}"
      kod[a+b] << [a,b]
      sums[a+b] += [hsh[a], hsh[b]].min*2
    end
  }
  p sums
  p kod
  # p sums.keys.sort.reverse
  sums.each {|sum, val| i+=val}
  i
end

def num_pairs_divisible_by60(time)
  return 0 if time.size < 1
  hsh = Hash.new(0)
  sums = Hash.new(0)
  kod = Hash.new{|h,k|h[k]=[]}
  time.each {|x| hsh[x]+=1}
  i = 0
  p hsh
  # p hsh.keys.sort.reverse
  hsh.keys.each do |a|
    sums[a] += ncr(hsh[a],2) if (a % 60 == 0 and hsh[a] > 1)
  end
  # p sums
  # p sums.keys.sort.reverse
  hsh.keys.combination(2).each {|a, b|
    # p [a,b,a+b]
    # sums[a] += hsh[a] if (a % 60 == 0 and sums[a] == 0 and hsh[a] > 1)
    # sums[b] += hsh[b] if (b % 60 == 0 and sums[b] == 0 and hsh[b] > 1)
    if (a+b)%60==0
      # p "#{a} #{b} #{a+b}"
      kod[a+b] << [a,b]
      # sums[a+b] += [hsh[a], hsh[b]].min*2
      sums[a+b] += hsh[a] * hsh[b]
    end
  }
  p sums
  p kod
  # p sums.keys.sort.reverse
  sums.each {|sum, val| i+=val}
  i
end


# time = [60]*5
# time = [60,120]*3
# time = [418,204,77,278,239,457,284,263,372,279,476,416,360,18] # 1, 13
# time = [269, 230, 318, 468, 171, 158, 350, 60, 287, 27, 11, 384, 332, 267, 412, 478, 280, 303, 242, 378, 129, 131, 164, 467, 345, 146, 264, 332, 276, 479, 284, 433, 117, 197, 430, 203, 100, 280, 145, 287, 91, 157, 5, 475, 288, 146, 370, 199, 81, 428, 278, 2, 400, 23, 470, 242, 411, 470, 330, 144, 189, 204, 62, 318, 475, 24, 457, 83, 204, 322, 250, 478, 186, 467, 350, 171, 119, 245, 399, 112, 252, 201, 324, 317, 293, 44, 295, 14, 379, 382, 137, 280, 265, 78, 38, 323, 347, 499, 238, 110, 18, 224, 473, 289, 198, 106, 256, 279, 275, 349, 210, 498, 201, 175, 472, 461, 116, 144, 9, 221, 473] # 105, 83..103..105 18/34
# time = [309,148,402,199,180,170,293,72,165,318,178,444,105,265,311,223,242,11,341,232,37,90,214,73,15,431,82,323,291,296,234,32,21,156,235,379,275,273,69,91,275,93,281,212,478,365,126,457,268,85,217,144,325,376,357,457,129,189,140,384,21,342,416,34,252,216,311,228,380,149,123,276,458,225,271,489,125,377,440,459,428,52,372,337,55,1,183,214,42,174,193,196,230,144,213,292,34,8,61,432,23,24,128,416,136,196,290,406,103,394,408,97,222,418,122,94,171,214,418,458,141,356,212,217,428,183,488,471,29,441,190,133,152,448,390,40,180,28,156,43,299,251,250,48,423,437,417,303,81,284,448,459,30,273,141,111,61,366,157,434,155,114,208,423,56,8,95,461,351,448,244,244,121,112,374,267,26,176,203,24,142,98,372,208,438,335,432,456,161,157,353,161,235,395,389,208] # 307 308.. 21/34.. ncr, 307
time =[14,161,302,232,270,428,155,64,499,400,25,349,434,427,5,265,20,346,463,10,1,163,189,345,390,212,498,281,308,482,447,217,318,239,374,449,298,213,2,230,5,500,300,390,139,484,464,477,111,88,93,198,181,113,393,283,383,205,42,292,335,392,384,268,361,462,413,176,118,111,143,242,166,286,177,52,126,342,415,302,210,48,369,148,209,87,212,53,296,95,97,45,467,47,373,404,43,439,19,64,289,218,268,460,238,456,490,155,429,218,301,225,228,237,453,267,259,327,427,169,176,322,216,451,29,327,404,177,225,44,248,174,287,326,441,354,110,4,226,324,331,158,454,469,354,383,336,211,133,500,233,330,471,327,426,478,195,232,163,312,126,51,161,248,433,348,464,206,480,478,98,354,304,424,338,382,431,379,194,488,6,494,394,469,430,1,207,307,172,47,269,472,415,163,309,68,213,175,343,187,15,232,429,389,373,143,146,88,58,320,116,82,482,125,343,329,115,116,183,389,112,294,74,89,62] # 426 425
p time
p num_pairs_divisible_by60(time)
p num_pairs_divisible_by60_all(time)


