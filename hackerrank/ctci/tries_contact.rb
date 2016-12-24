# #!/bin/ruby
#
# n = 4
# @inp = [
# 'add hack',
# 'add hackerrank',
# 'find hac',
# 'find hak',
# ]
#
# class Try < Hash
#   def initialize
#     super
#   end
#
#   def build(name)
#     name.chars.inject(self) do |hsh, char|
#       hsh[char] ||= { }
#     end
#   end
# end
#
#   CONTACT_LIST = {}
# DS = Try.new
#
# for a0 in (0..n-1)
#   op,contact = @inp[a0].split ' '
#
#
#   def add name
#     first = name[0]
#     CONTACT_LIST[first] = [] if !CONTACT_LIST[first]
#     CONTACT_LIST[first] << name
#   end
#
#   def find partial
#     first = partial[0]
#     @list = CONTACT_LIST[first]
#     check =-> part {count = 0; @list.each{|name| count+=1 if name[/(#{part})/,1]}; count}
#     puts(check[partial])
#   end
#
#   send(op,contact)
# end
#


#!/bin/ruby
#
n = 5
@inp = [
    'add hack',
    'add hbk',
    'add hac',
'find hac',
'find hak',
]

class Try < Hash
  def initialize
    super
  end

  def build(name)
    name.chars.inject(self) do |hsh, char|
      hsh['count'] = hsh['count'].nil? ? 1 : hsh['count'] + 1
      hsh[char] ||= {}
    end
  end

  def search(partial)
    partial.chars.inject(self) do |hsh, char|
      hsh[char] ? hsh[char] : (return hsh['count'])
    end
  end
end

CONTACT_LIST = Try.new

for a0 in (0..n-1)
  op, contact = @inp[a0].split ' '


  def add name
    CONTACT_LIST.build name
  end

  def find partial
    puts CONTACT_LIST.search partial
  end

  send(op, contact)
end

puts CONTACT_LIST


#
# n = 3
# @inp = [
#     'add hack',
#     'add ha',
#     'add cat'
# ]
#
# class Trie
#   attr_accessor :val, :down
#   def initialize key=nil
#     @key = key
#     @val = 0
#     @down = []
#   end
#
#   def build(name)
#     name.chars.inject(self) do |trie, char|
#       trie.val = trie.val + 1
#       next_trie = Trie.new(char)
#       trie.down << next_trie unless trie.down.include? next_trie
#       next_trie
#     end
#   end
#
#   def search(partial)
#
#   end
# end
#
# CONTACT_LIST = Trie.new
#
# for a0 in (0..n-1)
#   op,contact = @inp[a0].split ' '
#
#
#   def add name
#     CONTACT_LIST.build name
#   end
#
#   # def find partial
#   #   CONTACT_LIST.search partial
#   #   # check =-> part {count = 0; @list.each{|name| count+=1 if name[/(#{part})/,1]}; count}
#   #   puts(check[partial])
#   # end
#
#   send(op,contact)
# end
#
# puts CONTACT_LIST.inspect