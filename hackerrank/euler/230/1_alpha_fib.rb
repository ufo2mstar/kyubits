# This problem is a programming version of Problem 230 from projecteuler.net
#
# For any two strings of digits,  and , we define  to be the sequence (, , , , , ) in which each term is the concatenation of the previous two.
#
#     Further, we define  to be the -th digit in the first term of  that contains at least  digits.
#
#     Example:
#
#     Let , . We wish to find , say.
#
#     The first few terms of  are:
#
#                                 Then  is the -th digit in the fifth term, which is .
#
#     You are given  triples . For all of them find .
#
#         Input Format
#
# First line of each test file contains a single integer  that is the number of triples. Then  lines follow, each containing two strings of decimal digits  and  and positive integer .
#
#     Constraints
#
# Output Format
#
# Print exactly  lines with a single decimal digit on each: value of  for the corresponding triple.
#
#  Sample Input 0
#  2
#  1415926535 8979323846 35
#  1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679 8214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196 104683731294243150
#
#  Sample Output 0
#  9
#  8
#
# Enter your code here. Read input from STDIN. Print output to STDOUT


def fib_get n, a, b
  @fib = []
  @fib[1] = a.size
  @fib[2] = b.size
  i = fib_lim n, @fib
  # p @fib
  fib_find n, i, a, b, @fib
end

def fib_find(n, i, a, b, fib)
  if i == 1
    a[n-1]
  elsif i == 2
    b[n-1]
  else
    an = fib[i - 2]
    # bn = fib[i - 1]
    if n <= an
      fib_find(n, i - 2, a, b, fib)
    else
      fib_find(n - an, i - 1, a, b, fib)
    end
  end
end

def fib_lim(n, fib)
  if n <= fib[-1]
    fib.size - 1
  else
    fib << fib[-1] + fib[-2]
    fib_lim n, fib
  end
end


q = gets.chomp.to_i

q.times do
  a, b, n = gets.chomp.split
  p fib_get n.to_i, a, b
end

