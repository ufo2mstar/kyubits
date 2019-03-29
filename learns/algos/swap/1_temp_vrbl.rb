# Swapping two elements
# Method 1 (using temporary variable)

def swap(a,b)
  temp = a
  a = b
  b = temp
  return a,b
end
