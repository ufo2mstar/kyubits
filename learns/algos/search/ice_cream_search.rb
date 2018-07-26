# # Complete the whatFlavors function below.
# def whatFlavors(cost, money)
#   cost = cost.sort
#   sunny,johnny = 0,0
#   cost.each_with_index do |val,s|
#     pair = bin_search cost, val
#     if pair != -1
#       sunny = s+1
#       johnny = pair+1
#       puts "#{sunny} #{johnny}"
#       return [sunny,johnny]
#     end
#   end
#
# end
#
# def bin_search ary, x
#   return -1 if ary.empty?
#   low = 0
#   high = ary.size-1
#
#   while low<=high
#     mid = (low+high)/2
#     if ary[mid] == x
#       return mid
#     elsif ary[mid] < x
#       low = mid+1
#     else
#       high = mid-1
#     end
#   end
#   -1
# end

def whatFlavors(cost, money)
  cost_id = {}
  # cost_id.default = [] # does not work

  cost.each_with_index{|c,i|
    cost_id[c] ||= []
    cost_id[c] << i+1
  }

  sunny,johnny = 0,0
  cost.each_with_index do |val,s|
    pair = money - val
    if cost_id[pair]
      if cost_id[pair].size > 1
        sunny = cost_id[pair][0]
        johnny = cost_id[pair][1]
      elsif cost_id[pair].size == 1
        next if pair == val
        sunny = cost_id[val][0]
        johnny = cost_id[pair][0]
      end
      puts "#{sunny} #{johnny}"
      return [sunny,johnny]
    end
  end

end
