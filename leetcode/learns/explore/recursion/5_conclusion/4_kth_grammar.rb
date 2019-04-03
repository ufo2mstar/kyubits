# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
  find_n_k n, k, {}
end

def find_n_k n, k, cache
  return 0 if n == 1 and k == 1
  # return 0 if n == 2 and k == 1
  # return 1 if n == 2 and k == 2
  if cache[[n, k]]
    cache[[n, k]]
  elsif k > 2 ** (n - 1)
    # puts "error k = #{k} while n = #{n} (greater than 2 ^ (n - 1) = #{2 ** (n - 1)}"
    # p "kod"
  elsif k > 2 ** (n - 2)
    # puts "k = #{k} while n = #{n} (greater than 2 ^ (n - 2) = #{2 ** (n - 2)}"
    # cache[[n, k]] ||= flip(find_n_k n, k % 2 ** (n - 2), cache)
    cache[[n, k]] ||= flip(find_n_k n, k - 2 ** (n - 2), cache)
  else
    cache[[n, k]] ||= (find_n_k(n - 1, k, cache))
  end
end

def flip x
  x == 0 ? 1 : 0
end


# p kth_grammar 4, 1
# p kth_grammar 4, 2
# p kth_grammar 4, 3
# p kth_grammar 4, 4
# p kth_grammar 4, 5
# p kth_grammar 4, 6
# p kth_grammar 4, 7
# p kth_grammar 4, 8
# p kth_grammar 4, 9


i = 10

i.times do |n|
  (2**(n+1)).times do |k|
    print kth_grammar n+1,k+1
  end
  puts
end
