// Clone Graph
//   Go to Discuss
// Given the head of a graph, return a deep copy (clone) of the graph. Each node in the graph contains a label (int) and a list (List[UndirectedGraphNode]) of its neighbors. There is an edge between the given node and each of the nodes in its neighbors.
//
//
// OJ's undirected graph serialization (so you can understand error output):
// Nodes are labeled uniquely.
//
// We use # as a separator for each node, and , as a separator for node label and each neighbor of the node.
//
//
// As an example, consider the serialized graph {0,1,2#1,2#2,2}.
//
// The graph has a total of three nodes, and therefore contains three parts as separated by #.
//
// First node is labeled as 0. Connect node 0 to both nodes 1 and 2.
// Second node is labeled as 1. Connect node 1 to node 2.
// Third node is labeled as 2. Connect node 2 to node 2 (itself), thus forming a self-cycle.
//
//
// Visually, the graph looks like the following:
//
//        1
//       / \
//      /   \
//     0 --- 2
//          / \
//          \_/
// Note: The information about the tree serialization is only meant so that you can understand error output if you get a wrong answer. You don't need to understand the serialization to solve the problem.

/**
 * Definition for undirected graph.
 * class UndirectedGraphNode {
 *     int label;
 *     List<UndirectedGraphNode> neighbors;
 *     UndirectedGraphNode(int x) { label = x; neighbors = new ArrayList<UndirectedGraphNode>(); }
 * };
 */
public class Solution {
    public UndirectedGraphNode cloneGraph(UndirectedGraphNode node) {

        // 73 ms soln
        //  if(null == node)
        //     return node;
        // Map<UndirectedGraphNode,UndirectedGraphNode> hm = new HashMap<>();
        // hm.put(node,new UndirectedGraphNode(node.label));
        // return copyNode(node,hm);

        // 4 ms soln
        return copyNodeBfs(node);
    }
    private UndirectedGraphNode copyNodeBfs(UndirectedGraphNode root){
         if(null == root)
            return root;
        Queue<UndirectedGraphNode> q = new LinkedList<UndirectedGraphNode>();
        Map<UndirectedGraphNode,UndirectedGraphNode> visited = new HashMap<UndirectedGraphNode,UndirectedGraphNode>();
        q.add(root);
        UndirectedGraphNode copyRoot = new UndirectedGraphNode(root.label);
        visited.put(root,copyRoot);
        while(!q.isEmpty()){
            UndirectedGraphNode node = q.poll();

            UndirectedGraphNode copy;
            // if(visited.containsKey(node))
                copy = visited.get(node);
            // else
                // copy = new UndirectedGraphNode(node.label);

            for(UndirectedGraphNode child: node.neighbors){
                if(visited.containsKey(child))
                    copy.neighbors.add(visited.get(child));
                else {
                    UndirectedGraphNode copyChild = new UndirectedGraphNode(child.label);
                    copy.neighbors.add(copyChild);
                    visited.put(child,copyChild);
                    q.add(child);
                }
            }
            visited.put(node,copy);
        }
        return copyRoot;
    }

    private UndirectedGraphNode copyNode(UndirectedGraphNode root, Map<UndirectedGraphNode,UndirectedGraphNode> visited){
        if(null == root)
            return root;
        UndirectedGraphNode copyRoot = visited.get(root);
        visited.put(root,copyRoot);
        // copyRoot.neighbors = Arrays.copyOf(root.neighbors);
        // copyRoot.neighbors = root.neighbors;
        // copyRoot.neighbors = new ArrayList<UndirectedGraphNode>();
        for(UndirectedGraphNode node: root.neighbors){
            System.out.println(node.label);
            if(visited.containsKey(node))
                copyRoot.neighbors.add(visited.get(node));
            else{
                visited.put(node,new UndirectedGraphNode(node.label));
                copyRoot.neighbors.add(copyNode(node,visited));
            }
        }
        return copyRoot;
    }
}
