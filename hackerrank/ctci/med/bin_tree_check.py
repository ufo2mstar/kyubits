""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""

16.75

def check_binary_search_tree_(root):
    if root.left == None and root.right == None:
        return True
    elif root.left.data >= root.data or root.right.data <= root.data:
        return False
    else:
        if root.left != None:
            if check_binary_search_tree_(root.left):
                if root.right != None:
                    return check_binary_search_tree_(root.right)
            else:
                return False
        else:
            return check_binary_search_tree_(root.right)
    return True

4
2 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
No

20.61?

def check_binary_search_tree_(root):
    if root.left == None and root.right == None:
        return False
    elif root.left.data >= root.data or root.right.data <= root.data:
        return False
    else:
        if root.left != None:
            return check_binary_search_tree_(root.left)
        if root.right != None:
            return check_binary_search_tree_(root.right)
    return True


in order try

# Enter your code here. Read input from STDIN. Print output to STDOUT
""" Node is defined as
class node:
  def __init__(self, data):
      self.data = data
      self.left = None
      self.right = None
"""
def check_binary_search_tree_(root):
    last = None
    print("Yes") if check_bst(root,last) else print("No")

def check_bst(node,last):
    if root != None:
        if not check_bst(node.left):
            return False
        if self.last != None and node.data < last.data:
            return False
        self.last = node
        return check_bst(node.right)
    return True
