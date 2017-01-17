require 'benchmark'

# def my_str_cmp str1, str2
#   str1ary = str1.chars
#   str1ary = str1ary.uniq
#   until str1ary.empty? do
#     st1 = str1ary.shift
#     return "YES" if str2[/(#{st1})/, 1]
#     str1ary.delete st1
#   end
#   "NO"
# end

def my_str_cmp str1, str2
  str1ary = str1
  until str1ary.empty? do
    st1 = str1ary[0]
    return "YES" if str2[/(#{st1})/, 1]
    str1ary=str1ary.gsub(/#{st1}/,"")
  end
  "NO"
end

def siv_str_cmp str1, str2
  str1ary = ('a'..'z').to_a
  str1ary.size.times do |i|
    st1 = str1ary[i]
    return "YES" if str1[/(#{st1})/, 1] and str2[/(#{st1})/, 1]
  end
  "NO"
end

module RandomString
  def self.gen(n)
    #(0...n).map { (65 + rand(26)).chr }.join
    # (0...n).map { ('a'..'z').to_a[rand(26)] }.join
    (0...n).map { ('a'..'z').to_a.sample }.join
    # p a
    # a
  end
end
# include RandomString


module RandSeed
  def self.germinate
    # $rand_mod_num = (ENV['rand_mod_num'] || rand(50..99)).to_i
    big_rand      =-> num_of_rands_to_append { num_of_rands_to_append.times.map { rand(0..9).to_s }.join }
    $seed_id      = (SEED || big_rand[10]).to_i rescue big_rand[10].to_i
    puts "SeedID: #{$seed_id}"
    # $seeded       = Random.new $seed_id
    srand $seed_id # makes all rands repeatable!! Thanks Kernel
  end
end

HGETS = []
# HGETS << ['za', 'rt']
HGETS << ['hello', 'world']
HGETS << ["#{'a'*100}z", "#{'x'*100}z"]

HGETS << [RandomString.gen(10), RandomString.gen(10)]
HGETS << [RandomString.gen(100), RandomString.gen(100)]
HGETS << [RandomString.gen(1000), RandomString.gen(1000)]
HGETS << [RandomString.gen(10000), RandomString.gen(10000)]
# HGETS << [RandomString.gen(100000), RandomString.gen(100000)]

TGETS = HGETS.size
N=5
M=100

# SEED = "12345"
SEED = nil
RandSeed.germinate

TGETS.times { |n|
  puts HGETS[n]
  str1, str2=HGETS[n]
  break unless str1
  N.times do
    Benchmark.bm do |bm|
      bm.report("mine:") { M.times { my_str_cmp str1, str2 } }
      bm.report("your:") { M.times { siv_str_cmp str1, str2 } }
    end
  end
}

