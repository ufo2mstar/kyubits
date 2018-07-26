def cellCompete(states, days)
  # WRITE YOUR CODE HERE
  today = states
  next_day = today
  days.times do
    next_day = compete next_day
  end
  next_day
end

def compete today
  next_day = Array.new today.size
  last_house = today.size-1
  for house in 0..last_house do
    # default conditions
    left_house = 0
    right_house = 0

    # boundary conditions
    left_house = today[house-1] if house != 0
    right_house = today[house+1] if house != last_house

    # compete logic
    next_day[house] = left_house == right_house ? 0 : 1
  end
  next_day
end


def generalizedGCD(num, arr)
  current_gcd = arr[0]
  arr.each do |n|
    # using system library gcd
    # current_gcd = [current_gcd,current_gcd.gcd(n)].min

    # using home made gcd
    current_gcd = [current_gcd, gcd(current_gcd, n)].min
  end
  current_gcd
end

def gcd a, b
  return b if a == 0
  gcd(b%a, a)
end

# def gcd a,b
#   return a if a == b
#   return 0 if a == 0 or b == 0
#   return (a > b ? gcd(a-b,b) : gcd(a,b-a))
# end


# 23280670791993


def most_frequently_used_words(literatureText, wordsToExclude)

  words = literatureText.split

  exclude_set = {}
  wordsToExclude.each{|w| exclude_set[w] = true}

  freq_hsh = {}
  freq_hsh.default = 0

  max_count = 0
  words.each do |word|
    unless exclude_set[word]
      freq_hsh[word]+=1
      max_count = [max_count,freq_hsh[word]].max
    end
  end

  freq_list = []
  freq_hsh.each do |word, count|
    if count == max_count
      freq_list << word
    end
  end
  freq_list
end


def reorder_lines(logFileSize, logLines)
  text_lines = []
  num_lines = []
  logLines.each do |line|
    line_type_check line, text_lines, num_lines
  end

  # lexicographical sorting
  text_lines.sort!

  final_lines = []
  text_lines.each do |line_and_id|
    line_words = line_and_id.split
    final_lines << ([line_words[-1]]+line_words[0..-2]).join(" ")
  end
  # [final_lines,num_lines]
  final_lines+num_lines
end

def line_type_check line, text_lines, num_lines
  line_words = line.split
  if line_words[1] =~ /\d/
    num_lines << line
  else
    # hack to get the lines in order
    text_lines << (line_words[1..-1]+[line_words[0]]).join(" ")
  end
end
