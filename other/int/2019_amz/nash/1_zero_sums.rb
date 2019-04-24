def count_triplet_sums_n3 ary, target = 0
  count = 0
  (0...ary.size).each do |i|
    (i + 1...ary.size).each do |j|
      (j + 1...ary.size).each do |k|
        x, y, z = ary[i], ary[j], ary[k]
        if x + y + z == target
          count += 1
          # p [x,y,z]
        end
      end
    end
  end
  count
end

def count_triplet_sums_n2_hsh ary, target = 0
  set = Set.new
  count = 0
  hsh = ary.zip([true]*ary.size).to_h
  (0...ary.size).each do |i|
    (i + 1...ary.size).each do |j|
      x, y = ary[i], ary[j]
      z = target - (x + y)
      if hsh[z] and z != x and z != y
        # count += 1
        # p [x, y, z]
        set << [x, y, z].sort
      end
    end
  end
  # p set.to_a
  count = set.size
end
