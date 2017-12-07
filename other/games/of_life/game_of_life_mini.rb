# The code with some animation logic for demonstration.
#
life=->g,s{(0..s*s-1).map{|i|->n{n==3||(g[i]&&n==2)||nil}[[g[i-s-1],g[i-s],g[i-s+1],g[i-1],g[i+1],g[i+s-1],g[i+s],g[i+s+1]].compact.count]}}

size = 20
grid = (1..size*size).map { rand(0..1)==1 ? 1 : nil }

def run
while true do
  system 'clear'
  grid = life[grid, size]
  (0..size-1).each do |y|
    (0..size-1).each do |x|
      print "#{(grid[x+(y*size)] ? 'O' : '.')}"
    end
    puts
  end
  sleep 0.1
end
end

run