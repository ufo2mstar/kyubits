class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

def linkedlist_from_ary ary
  head = nil
  tail = nil
  ary.each do |x|
    node = ListNode.new x
    head = node if head.nil?
    if tail.nil?
      tail = node
    else
      tail.next = node
      tail = tail.next
    end
  end
  head
end
