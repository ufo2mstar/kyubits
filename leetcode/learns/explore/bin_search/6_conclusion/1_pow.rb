# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1 if n==0
  return (1/my_pow(x,-n)) if n < 0
  if n % 2 == 0
    a = my_pow(x,n/2)
    a*a
  else
    x * my_pow(x,n-1)
  end
end
