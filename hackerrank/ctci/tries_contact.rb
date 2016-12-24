#!/bin/ruby

n = 4
@inp = [
'add hack',
'add hackerrank',
'find hac',
'find hak',
]

class Node
  def initialize data
    @data = data
    @nodes = nil
  end

  def add

  end
end

  CONTACT_LIST = {}

for a0 in (0..n-1)
  op,contact = @inp[a0].split ' '


  def add name
    first = name[0]
    CONTACT_LIST[first] = [] if !CONTACT_LIST[first]
    CONTACT_LIST[first] << name
  end

  def find partial
    first = partial[0]
    @list = CONTACT_LIST[first]
    check =-> part {count = 0; @list.each{|name| count+=1 if name[/(#{part})/,1]}; count}
    puts(@list.include?(first) ? check[partial] : 0)
  end

  send(op,contact)
end

