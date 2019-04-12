class MyLinkedList

  class Node
    attr_accessor :val, :prev, :next
    def initialize val
      @val = val
    end
  end

=begin
    Initialize your data structure here.
=end
  def initialize()
    @list = nil
  end


=begin
    Get the value of the index-th node in the linked list. If the index is invalid, return -1.
    :type index: Integer
    :rtype: Integer
=end
  def get(index)
    return nil if index < 0
    node = @list
    # p index
    (index).times do |i|
      return -1 if node.nil?
      node = node.next
    end
    # p node.val
    node
  end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
  def add_at_head(val)
    node = Node.new val
    if @list.nil?
      @list = node
    else
      @list.prev = node
      @list = node
    end
  end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
  def add_at_tail(val)
    node = Node.new val
    if @list.nil?
      @list = node
    else
      tail = @list
      while tail.next do
        tail = tail.next
      end
      tail.next = node
      node.prev = tail
    end
  end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
  def add_at_index(index, val)
    node = get index
    if node and node != -1
      left = node.prev
      right = node
      curr = Node.new val
      left.next = curr if left
      curr.prev = left
      curr.next = right
      right.prev = curr
    end
  end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
  def delete_at_index(index)
    node = get index
    if node != -1
      left = node.prev
      right = node.next
      left.next = right
      right.prev = left if right
    end
  end

  def list
    node = @list
    res=""
    while node do
      res+= "<- #{node.val} ->"
      node = node.next
    end
    res
  end
end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)

["MyLinkedList","add_at_head","add_at_tail","add_at_index","get","delete_at_index","get"]
[[],[1],[3],[1,2],[1],[1],[1]]
# [null,null,null,null,2,null,3]

h = MyLinkedList.new
p h.list
h.add_at_head 1
p h.list
h.add_at_tail 3
p h.list
h.add_at_index 1,2
p h.list
h.add_at_index 0,2
p h.list
h.add_at_index 2,2
p h.list
h.get 1
p h.list
h.delete_at_index 1
p h.list
h.get 1
p h.list
