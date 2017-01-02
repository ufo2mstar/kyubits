#!/bin/ruby

m, n = gets.strip.split(' ')
m = m.to_i
n = n.to_i
magazine = gets.strip
magazine = magazine.split(' ')
ransom = gets.strip
ransom = ransom.split(' ')

mag, ran = {}, {}
hashify=-> ary, hsh { ary.each { |k| hsh[k] ? hsh[k]+=1 : hsh[k]=0 } }


check=-> mag, ran {
  ran.each { |ran_key, ran_val|
    return false if mag[ran_key] < ran_val
  }
}

if m<n
  puts "No"
else
  hashify[magazine, mag]
  hashify[ransom, ran]
  if check[mag, ran]
    puts "Yes"
  else
    puts "No"
  end
end

# 15 17
# o l x imjaw bee khmla v o v o imjaw l khmla imjaw x
# imjaw l khmla x imjaw o l l o khmla v bee o o imjaw imjaw o
#
# No