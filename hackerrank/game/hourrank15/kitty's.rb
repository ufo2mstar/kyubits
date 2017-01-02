# https://www.hackerrank.com/contests/hourrank-15/challenges/kittys-calculations-on-a-tree

# Dist(n1, n2) = Dist(root, n1) + Dist(root, n2) - 2*Dist(root, lca)
# 'n1' and 'n2' are the two given keys
# 'root' is root of given Binary Tree.
# 'lca' is lowest common ancestor of n1 and n2
# Dist(n1, n2) is the distance between n1 and n2