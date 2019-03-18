
# sample test 23280720465733

def cellCompete(states, days)
  # WRITE YOUR CODE HERE
  today = states
  next_day = today
  days.times do
    next_day = compete next_day
  end
  next_day
end

def compete today
  next_day = Array.new today.size
  last_house = today.size-1
  for house in 0..last_house do
    # default conditions
    left_house = 0
    right_house = 0

    # boundary conditions
    left_house = today[house-1] if house != 0
    right_house = today[house+1] if house != last_house

    # compete logic
    next_day[house] = left_house == right_house ? 0 : 1
  end
  next_day
end


def generalizedGCD(num, arr)
  current_gcd = arr[0]
  arr.each do |n|
    # using system library gcd
    # current_gcd = [current_gcd,current_gcd.gcd(n)].min

    # using home made gcd
    current_gcd = [current_gcd,gcd(current_gcd,n)].min
  end
  current_gcd
end

def gcd a,b
  return b if a == 0
  gcd(b%a,a)
end

# def gcd a,b
#   return a if a == b
#   return 0 if a == 0 or b == 0
#   return (a > b ? gcd(a-b,b) : gcd(a,b-a))
# end
