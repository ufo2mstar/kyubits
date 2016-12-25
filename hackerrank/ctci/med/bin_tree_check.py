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
