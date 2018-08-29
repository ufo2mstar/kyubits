class MyLinkedList

  class Node
    attr_accessor :val, :next_node

    def initialize(int)
      @val = int
    end

    def add_next_node(node)
      @next_node = node
    end
  end

  attr_accessor :list
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
    if @list
      node = @list
      (index).times do
        node = node.next_node
      end
      node
    else
# todo: handle unknown index
    end
  end


=begin
    Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    :type val: Integer
    :rtype: Void
=end
  def add_at_head(val)
    if @list
      old_head = @list
      @list = Node.new(val)
      @list.add_next_node old_head
    else
      @list = Node.new(val)
    end
  end


=begin
    Append a node of value val to the last element of the linked list.
    :type val: Integer
    :rtype: Void
=end
  def add_at_tail(val)
    if @list
      node = @list
      while node.next_node
        node = list.next_node
      end
      node.add_next_node Node.new(val)
    else
      add_at_head(val)
    end
  end


=begin
    Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
  def add_at_index(index, val)
    if @list
      if index == 0
        add_at_head(val)
      else
        prev_node = get(index-1)
        old_next_node = prev_node.next_node
        new_next_node = Node.new(val)
        new_next_node.add_next_node old_next_node
        prev_node.add_next_node new_next_node
      end
    else
# todo: handle unknown index
    end
  end


=begin
    Delete the index-th node in the linked list, if the index is valid.
    :type index: Integer
    :rtype: Void
=end
  def delete_at_index(index)
    if @list
      if index == 0
        @list = @list.next_node
      else
        node = get(index)
        prev_node = get(index-1)
        prev_node.add_next_node node.next_node
      end
    else
# todo: handle unknown index
    end
  end


end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)
