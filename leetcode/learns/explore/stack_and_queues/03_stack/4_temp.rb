# Daily Temperatures
# Go to Discuss
# Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.
#
#     For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].
#
#         Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].


# @param {Integer[]} t
# @return {Integer[]}
def bad_daily_temperatures(t)
  res = []
  t.each_with_index do |n, i|
    stop = t.size - i - 2
    (t[i+1..t.size]).each_with_index {|m, j|
      if (m > n)
        res << j+1
        break
      end
      res << 0 if j == stop
    }
  end
  res << 0
end


# @param {Integer[]} t
# @return {Integer[]}
def daily_temperatures(temperatures)
  stack = []
  res = Array.new(temperatures.length, 0)
  temperatures.length.times {|i|
    if stack.empty? || temperatures[stack[-1]] > temperatures[i]
      stack.push(i)
    else
      while !stack.empty? and temperatures[stack[-1]] < temperatures[i] do
        index = stack.pop
        res[index] = i - index
      end
      stack.push(i)
    end
  }
  res
end

# t=[1,2,4,3,2,4]
t= [73, 74, 74, 71, 69, 72, 76, 73]
p daily_temperatures(t)
