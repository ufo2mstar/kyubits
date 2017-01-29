# https://www.hackerrank.com/contests/world-codesprint-9/challenges/box-operations

# 1 l r c: Add  to each . Note that  can be negative.
#     2 l r d: Replace each  with .div d floor
#     3 l r: Print the minimum value of any .
#     4 l r: Print the sum of all .

#!/bin/ruby

n, q = gets.strip.split(' ')
n = n.to_i
q = q.to_i
box = gets.strip
box = box.split(' ').map(&:to_i)

class Oper
  def initialize box
    @box = box
  end

  def act *params
    act, l, r, x = params
    case act
      when 1 then
        one l, r, x
      when 2 then
        two l, r, x
      when 3 then
        three l, r
      when 4 then
        four l, r
      else

    end
  end

  def one l, r, c
    (l..r).each do |i|
      @box[i] += c
    end
  end

  def two l, r, d
    (l..r).each do |i|
      @box[i] = (@box[i]/d).floor
    end
  end


  def three l, r
    puts @box[l..r].min
  end


  def four l, r
    puts @box[l..r].reduce(&:+)
  end
end

o = Oper.new box
q.times do
  inp = gets.strip
  inp = inp.split(' ').map(&:to_i)
  o.act *inp
end
