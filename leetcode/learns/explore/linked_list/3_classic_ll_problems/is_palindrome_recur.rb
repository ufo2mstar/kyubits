# // Initial parameters to this function are &head and head
def is_palindrome_util(right)
  @left ||= @head

# /* stop recursion when right becomes NULL */
  return true if right == nil

# /* If sub-list is not palindrome then no need to 
# check for current left and right, return false */
  sublist_is_palin = is_palindrome_util right.next
  return false unless sublist_is_palin

# /* Check values at current left and right */
  sublist_is_palin = right.data == @left.data
# /* Move left to next node */
  @left = @left.next

  sublist_is_palin
end

def is_palindrome_diff_util(right)
  @left = @head
  return true if right.nil?
  fuse = is_palindrome_diff_util(right.next)
  return false unless fuse
  # @left.data == right.data ? @left = @left.next : false
  res = @left.data == right.data
  @left = @left.next
  res
end

def is_palindrome_diff2_util(right, left = nil)
  left ||= right
  return [true, left] if right.nil?
  fuse, left = is_palindrome_diff2_util(right.next, left)
  return false unless fuse
  [left.data == right.data, left.next]
end

# // A wrapper over isPalindromeUtil()
def is_palindrome(head)
  # is_palindrome_util(head) # nice
  # is_palindrome_diff_util(head) # good!
  res, kod = is_palindrome_diff2_util(head)
  res
end

class Node
  attr_accessor :data, :next

  def initialize(int)
    @data = int
  end
end

palin = Node.new 1
palin.next = Node.new 2
palin.next.next = Node.new 3
palin.next.next.next = Node.new 2
palin.next.next.next.next = Node.new 1

non_palin = Node.new 1
non_palin.next = Node.new 2
non_palin.next.next = Node.new 3
non_palin.next.next.next = Node.new 2
non_palin.next.next.next.next = Node.new 1
non_palin.next.next.next.next.next = Node.new 1

@head = palin
puts is_palindrome palin
@head = non_palin
puts is_palindrome non_palin



