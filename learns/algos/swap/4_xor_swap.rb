# Method 4 (Using bitwise XOR ,no temporary variable required)

def swap(a,b)
  a = a^b
  b = a^b
  a = a^b
  return a,b
end
