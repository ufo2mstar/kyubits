# returns index of needle
def bin_search_count ary, x
  return -1 if ary.empty?
  if 0
  end
end

def bin_search_count_util ary, x, startSearch
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
end
