# n-th order statistic
# Basically the nth smallest element in sorted order..
# arr = [1,6,4,8,7,9,3]
# 1st order statistic = 1
# 2nd order statistic = 3
# 5th order statistic = 7
#


def nth_order_stat arr, n
  arr.sort[n - 1] unless n < 1 or n > arr.size
end
