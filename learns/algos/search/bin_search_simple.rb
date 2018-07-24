# returns index of needle
def bin_search_simple ary, x
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
