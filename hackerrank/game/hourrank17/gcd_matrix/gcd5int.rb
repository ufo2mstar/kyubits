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
@ary = []

r_low = c_low = 1.0/0
r_high = c_high = -1.0/0

require 'set'

module IntervalTree

  class Tree
    def initialize(ranges, &range_factory)
      range_factory = lambda { |l, r| (l ... r+1) } unless block_given?
      ranges_excl = ensure_exclusive_end([ranges].flatten, range_factory)
      @top_node = divide_intervals(ranges_excl)
    end

    attr_reader :top_node

    def divide_intervals(intervals)
      return nil if intervals.empty?
      x_center = center(intervals)
      s_center = Array.new
      s_left = Array.new
      s_right = Array.new

      intervals.each do |k|
        case
          when k.last < x_center
            s_left << k
          when k.first > x_center
            s_right << k
          else
            s_center << k
        end
      end
      Node.new(x_center, s_center,
               divide_intervals(s_left), divide_intervals(s_right))
    end


    def search(interval)
      return nil unless @top_node
      if interval.respond_to?(:first)
        first = interval.first
        last = interval.last
      else
        first = interval
        last = nil
      end

      if last
        result = Array.new
        (first...last).each do |j|
          search(j).each { |k| result << k }
          result.uniq!
        end
        result.sort_by { |x| [x.first, x.last] }
      else
        point_search(self.top_node, first, []).sort_by { |x| [x.first, x.last] }
      end
    end

    private

    def ensure_exclusive_end(ranges, range_factory)
      ranges.map do |range|
        case
          when !range.respond_to?(:exclude_end?)
            range
          when range.exclude_end?
            range
          else
            range_factory.call(range.first, range.end)
        end
      end
    end

    # augmented tree
    # using a start point as resresentative value of the node
    def center(intervals)
      i = intervals.reduce([intervals.first.first, intervals.first.last]) { |acc, int| [[acc.first, int.first].min, [acc.last, int.last].max] }
      i.first + (i.last - i.first) / 2
    end

    def point_search(node, point, result)
      node.s_center.each do |k|
        if k.include?(point)
          result << k
        end
      end
      if node.left_node && (point < node.x_center)
        point_search(node.left_node, point, []).each { |k| result << k }
      end
      if node.right_node && (point >= node.x_center)
        point_search(node.right_node, point, []).each { |k| result << k }
      end
      result.uniq
    end
  end # class Tree

  class Node
    def initialize(x_center, s_center, left_node, right_node)
      @x_center = x_center
      @s_center = s_center
      @left_node = left_node
      @right_node = right_node
    end

    attr_reader :x_center, :s_center, :left_node, :right_node
  end # class Node

end # module IntervalTree

@rr = []
@cc = []
@rc_hsh = {}
for a0 in (0..q-1)
  r1, c1, r2, c2 = gets.strip.split(' ')
  r1 = r1.to_i
  c1 = c1.to_i
  r2 = r2.to_i
  c2 = c2.to_i
  name = "[#{r1},#{c1}][#{r2},#{c2}]"
  @set_hsh[name] = Set.new

  rr = (r1...r2+1)
  cc = (c1...c2+1)

  @rr << rr; @cc << cc
  @rc_hsh["r#{rr}"] = cc
  # @rc_hsh["c#{@cc}"] = @rr

  r_low = [r_low, r1].min
  c_low = [c_low, c1].min
  r_high = [r_high, r2].max
  c_high = [c_high, c2].max

end

# puts r_low, c_low, r_high, c_high

@rr = IntervalTree::Tree.new(@rr)
@cc = IntervalTree::Tree.new(@cc)

def gcd_drop arys, val
  arys.each { |s| @set_hsh[s] << val }
end

def region r, c
  res = []
  @r_ary = @rr.search(r)
  @c_ary = @cc.search(c)
  @r_ary.each{|rr| cc = @rc_hsh["r#{rr}"] ; @ary << [rr.first,rr.last-1,cc.first,cc.last-1] if @c_ary.include?(cc)}
  @ary.each do |lims|
    r1, r2, c1, c2 = lims
    name = "[#{r1},#{c1}][#{r2},#{c2}]"
    res << name
  end
  res
end

(r_low..r_high).each do |r|
  (c_low..c_high).each do |c|
    ary = region(r, c)
    unless ary.empty?
      x, y = [a[r], b[c]]
      res = (x).gcd(y)
      gcd_drop(ary, res)
    end
  end
end

puts @set_hsh.values.map(&:length)