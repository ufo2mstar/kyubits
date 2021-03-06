def bin_search(left, right, ary, target)
  return nil if left > right
  mid = (left + right) / 2
  if ary[mid] > target
    bin_search(left, mid - 1, ary, target)
  elsif ary[mid] < target
    bin_search(mid + 1, right, ary, target)
  else
    mid
  end
end


# int binarySearch(int arr[], int l, int r, int x)
def binarySearch(arr, l, r, x)
  if r >= l
    mid = l + (r - l) / 2
    # // If the element is present at the middle itself
    return mid if (arr[mid] == x)
    # // If element is smaller than mid, then it can only be present in left subarray
    # // Else the element can only be present in right subarray
    (arr[mid] > x) ? binarySearch(arr, l, mid - 1, x) : binarySearch(arr, mid + 1, r, x)
  end
  # // We reach here when element is not present in array
  -1
end

# def binary_search(arr, l, r, target)
#   if l <= r
#     mid = l + (r - l) / 2
#     return mid if (arr[mid] == target)
#     return (arr[mid] > target) ? binary_search(arr, l, mid - 1, target) : binary_search(arr, mid + 1, r, target)
#   end
#   -1
# end

# def binary_search(arr, l, r, target)
#   return -1 if l > r
#   mid = l + (r - l) / 2
#   return mid if (arr[mid] == target) # Found match!
#   (arr[mid] > target) ? binary_search(arr, l, mid - 1, target) : binary_search(arr, mid + 1, r, target)
# end

def binary_search(arr, l, r, target)
  return [-1, l, r] if l > r
  mid = l + (r - l) / 2
  return [mid, l, r] if (arr[mid] == target) # Found match!
  (arr[mid] > target) ? binary_search(arr, l, mid - 1, target) : binary_search(arr, mid + 1, r, target)
end
