# test id 23280666255286

# 23280666255286

# def IDsOfSongs(rideDuration, songDurations)
#   # WRITE YOUR CODE HERE
# end


# def IDsOfSongs(rideDuration, songDurations)
#   run_time = rideDuration - 30
#   ans_pairs = []
#   song_time_hsh = {}
#   songDurations.each_with_index {|s,i| song_time_hsh[s] = i}
#   songDurations.each_with_index do |song_time,song_i|
#     target_time = run_time - song_time
#     ans_pairs << [song_i,song_time_hsh[target_time]] if song_time_hsh[target_time]
#   end
#   # return ans_pairs[0] if ans_pairs.length == 1
#   return ans_pairs
# end


def IDsOfSongs(rideDuration, songDurations)
  run_time = rideDuration - 30
  ans_pair = []
  song_time_hsh = {}
  pair_max = -1 # init max

  songDurations.each_with_index {|s, i| song_time_hsh[s] = i}

  songDurations.each_with_index do |song_time, song_i|
    target_time = run_time - song_time
    if song_time_hsh[target_time]
      this_pair_max = [song_time, target_time].max
      if pair_max < this_pair_max
        pair_max = this_pair_max
        ans_pair = [song_i, song_time_hsh[target_time]]
      end
    end
  end

  return ans_pair.sort
end


rideDuration = 110
songDurations = [20, 70, 90, 30, 60, 110]
p IDsOfSongs(rideDuration, songDurations)

# 13 on 13


# def getMinimumCostToRepair(numTotalAvailableCities,
#                            numTotalAvailableRoads,
#                            roadsAvailable,
#                            numRoadsToBeRepaired,
#                            costRoadsToBeRepaired)
#   # WRITE YOUR CODE HERE
# end


numTotalAvailableCities = 6
numTotalAvailableRoads = 6
roadsAvailable = [[1, 2], [2, 3], [3, 4], [4, 5], [5, 1]]
numRoadsToBeRepaired = 3
costRoadsToBeRepaired = [[1, 2, 12], [5, 1, 30], [4, 5, 8]]

getMinimumCostToRepair(numTotalAvailableCities,
                       numTotalAvailableRoads,
                       roadsAvailable,
                       numRoadsToBeRepaired,
                       costRoadsToBeRepaired)

cost_hsh

# 5 out of 19

# just min of answer returned!


# The problems were really good!
# I felt the domain coverage was also good,
#                                     but I do have some thoughts:
#                                                            1. It would have been good to see the edge cases and assumptions to simplify the problem so that the domain is a little more limited
# 2. Given the limited time to solve the problems, they sure were worded pretty long! :( don't know if that is by design..
# 3. on a personal note, given the time constraint, and that one of the problems was in the 'easy' and one in the 'hard' category,
# I would have liked either some more time or two 'medium' problems!
# But overall, I liked the experience a lot and am looking forward to improvements in the system from Day one! Cheers..


# RubyMine 2017.2.4
# Build #RM-172.4155.44, built on September 26, 2017
# Licensed to Ping Lin
# Subscription is active until March 29, 2019
# JRE: 1.8.0_101-b13 x86
# JVM: Java HotSpot(TM) Client VM by Oracle Corporation
# Windows 10 10.0
