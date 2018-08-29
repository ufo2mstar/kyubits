
def bin_search(left, right, ary, target)
  return nil if left > right
  mid = (left+right)/2
  if ary[mid] > target
    bin_search(mid+1,right,ary, target)
  elsif ary[mid] < target
    bin_search(left,mid-1,ary, target)
  else
    mid
  end
end
