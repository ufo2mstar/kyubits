# First Bad Version
# Go to Discuss
# You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
#
#     Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
#
#     You are given an API bool is_bad_version(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
#
#     Example:
#
#     Given n = 5, and version = 4 is the first bad version.
#
#     call is_bad_version(3) -> false
# call is_bad_version(5) -> true
# call is_bad_version(4) -> true
#
# Then 4 is the first bad version.
#
# # The is_bad_version API is already defined for you.
# # @param {Integer} version
# # @return {boolean} whether the version is bad
# # def is_bad_version(version):
#
# # @param {Integer} n
# # @return {Integer}
# def first_bad_version(n)
#   last_fbv = -1
#   if !is_bad_version n
#     return last_fbv
#   elsif n == 1
#     return 1
#   else
#     lb = 0
#     ub = n
#     offset = Math.sqrt(ub-lb).to_i
#     search_down = true
#     while lb <= ub
#       search = search_down ? ub-offset : lb+offset
#       if is_bad_version search
#         ub = search
#         search_down = true
#       else
#         return ub if ub == lb
#         lb = search + 1
#         offset = Math.sqrt(ub-lb).to_i
#         search_down = false
#       end
#     end
#     return lb
#   end
# end

class NoBadVersion < StandardError
end



def find_bad_version(n)
  start = 0
  last = n

  return start if is_bad_version(start)
  puts 'all good' unless is_bad_version(last)

  while start <= last
    mid = start + (last-start) / 2
    if is_bad_version(mid)
      return last if start == last
      last = mid
    else
      start = mid + last
    end
  end
end

def is_bad_version n
  n >= 5
end

10.times do |i|
  p "#{i} , #{is_bad_version i}"
end

# p find_bad_version 1
# p find_bad_version 5
# p find_bad_version 8
