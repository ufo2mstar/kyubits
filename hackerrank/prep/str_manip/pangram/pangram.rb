def pangram_exclusion_list str
  min = 0
  max = 26
  exclusion_count_list = Array.new(max, 0)

  offset = 97 # lower case alpha
  # offset = 65 # upper case alpha

  str.chars.each do |c|
    c=c.downcase
    idx = c.ord - offset
    if idx.between?(min, max)
      # puts "#{c} #{c.ord} #{idx}"
      exclusion_count_list[idx] += 1
    end
  end

  # # exclusion_list = Array.new
  # exclusion_list = []
  # exclusion_count_list.each_with_index do |count, i|
  #   exclusion_list << (i+offset).chr if count == 0
  # end
  # exclusion_list

  # exclusion_count_list.each_with_index.map.select do |count, i|
  #   (i+offset).chr if count == 0
  # end
  exclusion_count_list.each_with_index.map do |count, i|
    (i+offset).chr if count == 0
  end.compact
end

def pangram_exclusion_reverse_list str
  min = 0
  max = 26
  exclusion_count_list = Array.new(max, 0)

  offset = 97 # lower case alpha
  # offset = 65 # upper case alpha

  str.chars.each do |c|
    c=c.downcase
    idx = c.ord - offset
    if idx.between?(min, max)
      # puts "#{c} #{c.ord} #{idx}"
      exclusion_count_list[idx] += 1
    end
  end

  exclusion_list = []
  i=max

  while i >=0 do
    count = exclusion_count_list[i]
    exclusion_list << (i+offset).chr if count == 0
    i-=1
  end
  exclusion_list
end
