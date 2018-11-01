def bin_compare nums, x
  left, right = 0, nums.size-1
  # t1 = bin1 nums, left, right, x
  t1, left1, right1 = bin1 nums, left, right, x
  puts "mid1 = #{t1}, start ( left=#{left}, right=#{right} ) -> left_res=#{left1}, right_res=#{right1}"

  left, right = 0, nums.size
  # t2 = bin2 nums, left, right, x
  t2, left2, right2 = bin2 nums, left, right, x
  puts "mid2 = #{t2}, start ( left=#{left}, right=#{right} ) -> left_res=#{left2}, right_res=#{right2}"

  left, right = 0, nums.size-1
  # t3 = bin3 nums, left, right, x
  t3, left3, right3 = bin3 nums, left, right, x
  puts "mid3 = #{t3}, start ( left=#{left}, right=#{right} ) -> left_res=#{left3}, right_res=#{right3}"

end

# Target focus on only one item
def bin1(nums, left, right, x)
  count = 0
  while left <= right
    mid = (left+right)/2
    count = show count, left, right, mid
    if nums[mid] == x
      # return mid
      return [mid, left, right]
    else
      if nums[mid] < x
        left = mid+1
      else
        right = mid-1
      end
    end
  end
  -1
end

# Min search space 2 items.. item and its right
def bin2(nums, left, right, x)
  mid = nil
  count = 0
  while left < right
    mid = (left+right)/2
    count = show count, left, right, mid
    if nums[mid] == x
      # return mid
      return [mid, left, right]
    else
      if nums[mid] < x
        left = mid+1
      else
        right = mid
      end
    end
  end
  [mid, left, right]
end

# Min search space three! left,item,right
def bin3(nums, left, right, x)
  mid = nil
  count = 0
  while left+1 < right
    mid = (left+right)/2
    count = show count, left, right, mid
    if nums[mid] == x
      # return mid
      return [mid, left, right]
    else
      if nums[mid] < x
        left = mid+1
      else
        right = mid-1
      end
    end
  end
  [mid, left, right]
end

def show count, left, right, mid
  puts "\t#{count}\t left= #{left} <- mid = #{mid} -> right= #{right}"
  count + 1
end
