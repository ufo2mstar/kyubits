# Symmetric Tree
# Go to Discuss
# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
#
#     For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
#
#                                                          1
# / \
#   2   2
#  / \ / \
# 3  4 4  3
# But the following [1,2,2,null,3,null,3] is not:
#                                                1
# / \
#   2   2
#    \   \
#    3    3
# Note:
# Bonus points if you could solve it both recursively and iteratively.


# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric_itr(root)
  return true if root.nil?
  lq = [root]
  rq = [root]
  until(lq.empty? and rq.empty?) do
    return false if lq.size != rq.size
    lq.size.times do
      l = lq.shift
      r = rq.shift
      if (l.nil? and !r.nil?) or (!l.nil? and r.nil?)
        return false
      elsif l.nil? and r.nil?
        next
      elsif l.val == r.val #and l.left == r.right and r.left == l.right
        lq << l.right #if l.right
        rq << r.left #if r.left
        lq << l.left #if l.left
        rq << r.right #if r.right
      else
        return false
      end
    end
  end
  true
end

def is_symmetric_recu(root)
  return true if root.nil?
  return symm_util(root.left,root.right)
end

def symm_util l,r
  if l.nil? and r.nil?
    return true
  elsif l.nil? or r.nil? or l.val != r.val
    return false
  else
    symm_util(l.left,r.right) and symm_util(r.left,l.right)
  end
end

def is_symmetric(root)
  # is_symmetric_itr(root)
  is_symmetric_recu(root)
end
