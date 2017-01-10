def traverse(array)
  array.each_with_index.flat_map{|r,i| r.each_with_index.map{|c,j| [c,i,j]}}
      .sort_by{|m,i,j| [(i+j),j]}.map{|a,i,j| a}
end

p traverse([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

# => [1, 4, 2, 7, 5, 3, 8, 6, 9]


