class Node

  attr_accessor :left, :right, :data

  def initialize data
    @data = nil
    @left = nil
    @right = nil
  end
end

class BST
  attr_accessor :root, :prev

  def initialize

  end

  def isBST(node)

    # // traverse the tree in inorder fashion and
    # // keep a track of previous node
    if (node != nil)

      if (!isBST(node.left))
        return false
      end

      # // allows only distinct values node
      if (prev != nil && node.data <= prev.data)
        return false
      end
      p "prev -#{prev}"
      @prev = node
      return isBST(node.right)
    end
    true
  end

end

tree = BST.new
tree.root = Node.new(3)
tree.root.left = Node.new(2)
tree.root.right = Node.new(5)
tree.root.left.left = Node.new(1)
tree.root.left.right = Node.new(4)

if tree.isBST nil
  p("IS BST")
else
  p("Not a BST")
end