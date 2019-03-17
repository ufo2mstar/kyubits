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


# time = [60]*5
# time = [60,120]*3
# time = [418,204,77,278,239,457,284,263,372,279,476,416,360,18] # 1, 13
time = [269, 230, 318, 468, 171, 158, 350, 60, 287, 27, 11, 384, 332, 267, 412, 478, 280, 303, 242, 378, 129, 131, 164, 467, 345, 146, 264, 332, 276, 479, 284, 433, 117, 197, 430, 203, 100, 280, 145, 287, 91, 157, 5, 475, 288, 146, 370, 199, 81, 428, 278, 2, 400, 23, 470, 242, 411, 470, 330, 144, 189, 204, 62, 318, 475, 24, 457, 83, 204, 322, 250, 478, 186, 467, 350, 171, 119, 245, 399, 112, 252, 201, 324, 317, 293, 44, 295, 14, 379, 382, 137, 280, 265, 78, 38, 323, 347, 499, 238, 110, 18, 224, 473, 289, 198, 106, 256, 279, 275, 349, 210, 498, 201, 175, 472, 461, 116, 144, 9, 221, 473] # 105, 83
p time
p num_pairs_divisible_by60(time)
p num_pairs_divisible_by60_all(time)
