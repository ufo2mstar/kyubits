def generalizedGCD(num, arr)
  gcd = 0
  if num == 1
    return arr[0]
  else
    gcd = gcd_rec arr[0],arr[1]
    arr.each do |x|
      gcd = gcd_rec x,gcd
    end
  end
  gcd
end


def gcd_rec a,b
  x,y = [a,b].sort
  return 1 if x == 1
  return x if x % y == 0
  gcd_rec x,y-x
end

# def gcd_rec a,b
#   if a >= b
#     c = b % a
#   else
#     c = a % b
#   end
#   return a if c == 0
#   return gcd_rec c,[a,b].min
# end

arr1 = [2,3,4,5,6]
arr2 = [2,4,6,8,10]

p generalizedGCD(5, arr1)
p generalizedGCD(5, arr2)
