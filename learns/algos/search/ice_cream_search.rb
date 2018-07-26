# Complete the whatFlavors function below.
def whatFlavors(cost, money)
  cost = cost.sort
  sunny,johnny = 0,0
  cost.each_with_index do |val,s|
    pair = bin_search cost, val
    if pair != -1
      sunny = s+1
      johnny = pair+1
      puts "#{sunny} #{johnny}"
      return [sunny,johnny]
    end
  end

end

def bin_search ary, x
  return -1 if ary.empty?
  low = 0
  high = ary.size-1

  while low<=high
    mid = (low+high)/2
    if ary[mid] == x
      return mid
    elsif ary[mid] < x
      low = mid+1
    else
      high = mid-1
    end
  end
  -1
end
