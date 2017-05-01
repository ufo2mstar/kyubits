#!/bin/ruby

class Friends
  def initialize people
    @total_people = people
    @tree = Array.new people+1
    @val = Array.new people+1, 0
    @tree[0] = @val[0] = nil # just to be sure of not using [0]
    @root_count = {}
    @sum = 0
  end

  def parent_of node
    @tree[node]
  end

  def sum
    flatten
    # @val.reduce(&:+)
    # p @tree.uniq
    p @root_count
    @root_count.values.inject(0){|sum,n| n*(n-1) }
  end

  def out
    puts @sum
  end

  def union friend_l, friend_r
    root_l = find_root friend_l
    root_r = find_root friend_r
    # p " adding #{friend_l} n #{friend_r} to #{@tree}"
    # p "#{friend_l} + #{friend_r} to #{@sum}"
    if root_l and root_r
      min = [root_l,root_r].min
      @tree[root_l] = min
      @tree[friend_l] = min
      @tree[root_r] = min
      @tree[friend_r] = min
    elsif root_l.nil? and root_r.nil?
      min = [friend_l,friend_r].min
      @tree[friend_l] = min
      @tree[friend_r] = min
    elsif root_r.nil?
      @tree[friend_r] = root_l
    else
      @tree[friend_l] = root_r
    end
    @sum+=sum
    @root_count = {}
  end

  def show
    p @tree
  end

  private
  def find_root p
    # also flattens
    parent = @tree[p]
    return unless parent
    stack = []
    until @tree[parent] == parent do
      stack << parent
      parent = @tree[parent]
    end
    until stack.empty?
      @tree[stack.pop] = parent
    end
    parent
  end

  def flatten
    (1..@total_people).each do |n|
      root = find_root(n)
      next unless root
      @root_count[root] ||= 0
      @root_count[root] += 1
    end
  end

  def reset_circle root
    new_count = @val[root]+1
    # update count
    (1..@total_people).each do |n|
      @val[n] = new_count if @tree[n] == root
    end
  end
end

t = gets.strip.to_i
for a0 in (0..t-1)
  n, m = gets.strip.split(' ')
  n = n.to_i
  m = m.to_i
  f = Friends.new n
  for a1 in (0..m-1)
    x, y = gets.strip.split(' ')
    x = x.to_i
    y = y.to_i
    # adding friend circle
    f.union x, y
  end
  # f.show
  f.out
end
