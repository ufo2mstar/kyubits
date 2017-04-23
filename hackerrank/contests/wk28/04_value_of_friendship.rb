#!/bin/ruby


class Circle

  def initialize
    @circle = {} #group array
    @friends = {} #per person
    @score = {} #per person
    @sum = 0
    @circ_num = 0
  end

  def add_friend a,b
    #add_score x,y
    add a,b
    add b,a

  end

  def add x,y
    if @friends[x]
      # already in a group, so
      return
    elsif @friends[y]
      @friends[x] = @friends[y]
      @circle[@friends[x]] << x
    else
      circ = init_circle(x)
      @friends[x] = circ
      @friends[y] = circ
      @circle[@friends[x]] << x
      @circle[@friends[y]] << y
    end
  end

  def add_score x,y
    @friends
  end

  def init_circle p
    @circle[@circ_num +=1] ||= []
    @circ_num
  end

  def compute_total
    # @sum+= @score.values.flatten.reduce(&:+)
    @sum = 0
    @circle.values.each{|c| l=(c.length);@sum+=l*(l-1)}
    @sum
  end

  def show
    puts @circle
    puts @friends
  end
end

g = Circle.new

t = gets.strip.to_i
for a0 in (0..t-1)
  n,m = gets.strip.split(' ')
  n = n.to_i
  m = m.to_i
  tots = 0
  for a1 in (0..m-1)
    x,y = gets.strip.split(' ')
    x = x.to_i
    y = y.to_i
    # adding friend circle
    g.add_friend x,y
    # summing per round, totally
    tots+= g.compute_total
  end
  #puts g.show
  puts tots
end
