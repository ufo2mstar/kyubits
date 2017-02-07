#!/bin/ruby

n, m, q = gets.strip.split(' ')
n = n.to_i
m = m.to_i
q = q.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)
b = gets.strip
b = b.split(' ').map(&:to_i)
@set_hsh = {}
@ary_hsh = {}

puts n*m
r_low = c_low = 1.0/0
r_high = c_high = -1.0/0

require 'set'
cc1 = 0
cc4 = 0
for a0 in (0..q-1)
  r1, c1, r2, c2 = gets.strip.split(' ')
  r1 = r1.to_i
  c1 = c1.to_i
  r2 = r2.to_i
  c2 = c2.to_i
  str = "[#{r1},#{c1}][#{r2},#{c2}]"
  @set_hsh[str] = Set.new
  @ary_hsh[[[r1, r2], [c1, c2]]] = str

  r_low = [r_low, r1].min
  c_low = [c_low, c1].min
  r_high = [r_high, r2].max
  c_high = [c_high, c2].max

  (r1..r2).each do |r|
    (c1..c2).each do |c|
      cc1+=1
    end
  end
  cc4 += (r2-r1)*(c2-c1)

end

puts r_low, c_low, r_high, c_high

def gcd_drop arys, val
  arys.each { |s| @set_hsh[s] << val }
end

def region r, c
  res = []
  @ary_hsh.each do |lims, name|
    r1, r2, c1, c2 = lims.flatten
    if r <= r2 and c <= c2 and r >= r1 and c >= c1
      res << name
    end
  end
  res
end

cc2= 0
cc3= 0

(r_low..r_high).each do |r|
  (c_low..c_high).each do |c|
    ary = region(r, c)
    unless ary.empty?
      # x, y = [a[r], b[c]]
      # res = (x).gcd(y)
      # gcd_drop(ary, res)
      cc2+=1
    end
    cc3+=1
  end
end

puts cc1, cc2, cc3, cc4
# puts @set_hsh.values.map(&:length)