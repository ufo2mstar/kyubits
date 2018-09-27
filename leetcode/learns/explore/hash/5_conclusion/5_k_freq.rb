# Top K Frequent Elements
# Go to Discuss
# Given a non-empty array of integers, return the k most frequent elements.
#
#     Example 1:
#
#     Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]
# Example 2:
#
#     Input: nums = [1], k = 1
# Output: [1]
# Note:
#
#     You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
#     Your algorithm's time complexity must be better than O(n log n), where n is the array's size.


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  counts = Hash.new(0)
  freq = Hash.new(){|h,k|h[k] = []}
  # freq = {}
  nums.each{|n|counts[n]+=1}
  counts.each{|n,c|freq[c] << n}
  max_coutns = freq.keys.sort
  res = []
  k.times{|t|res << freq[max_coutns[-t-1]]}
  res.flatten[0..k-1]
end
