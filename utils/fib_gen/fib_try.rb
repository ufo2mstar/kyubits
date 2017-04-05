fib = Fiber.new do
  x, y = 0, 1
  loop do
    Fiber.yield y
    x, y = y, x + y
  end
end

# 2_000.times { puts fib.resume }

# My Generator - using fibers
class Gen
  def initialize ary
    @ary = ary
    siz = ary.size
    @fib = Fiber.new do
      i = 0
      loop do
        @next = i < siz
        Fiber.yield @ary[i]
        i+=1
      end
    end
  end

  def next?
    @next
  end

  def next not_strict = nil
    @last = (not_strict ? (@fib.resume || rnd) : @fib.resume)
    @last || raise("Generator Exhausted")
  end

  def last
    @last # should return nil if uninitiated
  end

  def rnd
    @ary.sample
  end
end

gen = Gen.new (1..4).to_a

# srand 123

10.times { print gen.next 'chill' }
10.times { puts gen.next }
10.times { print gen.rnd }