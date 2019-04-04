def binary_search(arr, l, r, target)
  until l > r
    mid = l + (r - l) / 2
    return mid if (arr[mid] == target) # Found match!
    (arr[mid] > target) ? r = mid - 1 : l = mid + 1
  end
  -1
end
