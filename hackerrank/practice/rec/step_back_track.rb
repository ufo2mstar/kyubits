# Complete the stepPerms function below.
def stepPerms(n)
  jumps = [1,2,3]
  res = step(n,0,jumps,{})
  res % (7+10e9)
end

def step n,count,jumps,mem
  if n < 0
    0
  elsif n == 0
    1
  elsif mem[n]
    return mem[n]
  else
    jumps.each do |i|
      count+=step n-i,count,jumps,mem
    end
    mem[n] = count
  end
end

n=5
p stepPerms(n)
