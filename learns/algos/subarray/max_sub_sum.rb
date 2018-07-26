def mss_kadane ary
  curr_max= total_max = 0
  ary.each {|a|
    curr_max = [curr_max+a, a].max
    # curr_max += a
    total_max = [curr_max, total_max].max
    curr_max = 0 if curr_max < 0
    # puts "curr_max = #{curr_max} , total_max = #{total_max}"
  }
  total_max
  # for i=1 to size-1
  #   curMax = max(arr[i],arr[i] + curMax)
  #   gMax =max(curMax , gMax)
  #   return gMax
end
