def bin_compare nums, x
  left, right = 0, nums.size-1
  t1 = bin1 nums, left, right, x
  t1, left1, right1 = bin1 nums, left, right, x
  puts "mid1 = #{t1}, start ( left=#{left}, right=#{right} ) -> left_res=#{left1}, right_res=#{right1}"

  left, right = 0, nums.size
  t2 = bin2 nums, left, right, x
  t2, left2, right2 = bin2 nums, left, right, x
  puts "mid2 = #{t2}, start ( left=#{left}, right=#{right} ) -> left_res=#{left2}, right_res=#{right2}"

  left, right = 0, nums.size-1
  t3 = bin3 nums, left, right, x
  t3, left3, right3 = bin3 nums, left, right, x
  puts "mid3 = #{t3}, start ( left=#{left}, right=#{right} ) -> left_res=#{left3}, right_res=#{right3}"

end

def bin1(nums, left, right, x)
  while left <= right
    mid = (left+right)/2
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

def bin2(nums, left, right, x)
  mid = nil
  while left < right
    mid = (left+right)/2
    if nums[mid] < x
      left = mid+1
    else
      right = mid
    end
  end
  [mid,left,right]
end

def bin3(nums, left, right, x)
  mid = nil
  while left+1 < right
    mid = (left+right)/2
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
  [mid,left,right]
end
