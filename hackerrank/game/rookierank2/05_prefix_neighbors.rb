class Trie
  attr_accessor :val, :children, :key, :last

  def initialize key='base'
    @key = key
    @val = 0
    @children = {}
    @last = false
  end

  def build(name)
    # puts "storing #{name}"
    last_trie = nil
    name.chars.inject(self) do |trie, char|
      # puts " in #{trie.key} - val = #{trie.val}"
      # trie.val = trie.val + 1
      next_trie = trie.children[char] || (trie.children[char]= Trie.new(char))
      next_trie.val += 1
      last_trie = next_trie
      next_trie
    end
    last_trie.last = true
  end

  def search(name)
    # puts "searching for #{name}"
    final_node = name.chars.inject(self) do |trie, char|
      return 0 unless trie.children[char]
      trie.children[char]
    end
    final_node.val
  end
end

@dict = Trie.new


def bene str
  str.chars.inject(0) { |b, c| b+=c.ord }
end

n = gets.strip.to_i
s = gets.strip
s = s.split(' ')

# def add str
#   @dict.build str
# end

for str in s
  @dict.build str
end

puts @dict.inspect

# def find partial
#   puts @dict.search partial
# end
