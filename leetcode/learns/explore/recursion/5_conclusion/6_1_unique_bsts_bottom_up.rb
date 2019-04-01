# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end


def generateTrees n
  return [] if n == 0
  xmp = generate(1, n)
  xmp
end

def generate(start, last)
  res = []
  (start..last).each do |root|

    leftTrees = generate(start, root - 1)
    rightTrees = generate(root + 1, last)

    leftTrees.each do |left|
      rightTrees.each do |right|
        node = TreeNode.new(root)
        node.left = left
        node.right = right

        res << node
      end
    end
  end
  res.empty? ? [nil] : res
  # res || [nil]
end

p generateTrees 3
p generateTrees 5
# p generateTrees 2
