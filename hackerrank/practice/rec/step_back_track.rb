# Complete the stepPerms function below.
def stepPerms(n)
  jumps = [1, 2, 3]
  res = step(n, jumps, {})
  res % (7 + 10e9).to_i
end

def step n, jumps, mem
  if n < 0
    0
  elsif n == 0
    1
  elsif mem[n]
    return mem[n]
  else
    count = 0
    jumps.each do |i|
      count += step n - i, jumps, mem
    end
    mem[n] = count
  end
end

n = 7
p stepPerms(n)
