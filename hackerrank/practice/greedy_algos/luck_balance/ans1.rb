# def luckBalance(k, contests)
#
#     # sort from greatest luck to least luck
#     contests.sort(reverse=true)
# luck, important = 0, 0
#
# for contest in contests:
#   if contest[1] == 0:
#       luck += contest[0]
#   elif important < k:
#       luck += contest[0]
#   important += 1
#   else:
#       luck -= contest[0]
#
#   return luck

def luckBalance k, contests

  # sort from greatest luck to least luck
  contests.sort.reverse
  luck, important = 0, 0

  for contest in contests
    if contest[1] == 0
      luck += contest[0]
    elsif important < k
      luck += contest[0]
      important += 1
    else
      luck -= contest[0]
    end
  end
  luck
end
