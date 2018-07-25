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
  total_houses = today.size
  for house in 0..total_houses-1 do
    left_house = 0
    right_house = 0

    # boundary conditions
    if house == 0
      right_house = today[house+1]
    elsif house == total_houses-1
      left_house = today[house-1]
    else
      left_house = today[house-1]
      right_house = today[house+1]
    end

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
