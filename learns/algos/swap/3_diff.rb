
# Method 3 (Using sum and difference, no temporary variable required) Caveat: Can lead to integer overflow if a and b are really large integers

def swap(a,b)
  a = a+b
  b = a-b
  a = a-b
  return a,b
end

