import java.util.*;
import java.io.*;

class Node {
    Node left;
    Node right;
    int data;

    Node(int data) {
        this.data = data;
        left = null;
        right = null;
    }
}

class Solution {

	/*
    class Node
    	int data;
    	Node left;
    	Node right;
	*/
	public static Node lca(Node root, int v1, int v2) {
      	ArrayList<Node> toV1 = pathTo(v1,root);
        ArrayList<Node> toV2 = pathTo(v2,root);

            // System.out.print(toV1.size());
            // System.out.print("  ");
            // System.out.println(toV2.size());


        Node common = root;
        while(!toV1.isEmpty() && !toV2.isEmpty()){
            Node v1Node = toV1.get(toV1.size()-1);
            Node v2Node = toV2.get(toV2.size()-1);

            // System.out.print(v1Node.data);
            // System.out.print("  ");
            // System.out.println(v1Node.data);

            if(v1Node==v2Node){
                common = v1Node;
                toV1.remove(toV1.size() - 1);
                toV2.remove(toV2.size() - 1);
            }
            else
                break;
        }
        return common;
    }

    static ArrayList<Node> pathTo(int v, Node node){
        if(node == null)
            return null;
        if(node.data == v)
            return new ArrayList<Node>();
        ArrayList<Node> path = null;

        path = pathTo(v,node.left);
        if(path != null){
            path.add(node);
            return path;
        }
        path = pathTo(v,node.right);
        if(path != null){
            path.add(node);
            return path;
        }
        return null;
    }

	public static Node insert(Node root, int data) {
        if(root == null) {
            return new Node(data);
        } else {
            Node cur;
            if(data <= root.data) {
                cur = insert(root.left, data);
                root.left = cur;
            } else {
                cur = insert(root.right, data);
                root.right = cur;
            }
            return root;
        }
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int t = scan.nextInt();
        Node root = null;
        while(t-- > 0) {
            int data = scan.nextInt();
            root = insert(root, data);
        }
      	int v1 = scan.nextInt();
      	int v2 = scan.nextInt();
        scan.close();
        Node ans = lca(root,v1,v2);
        System.out.println(ans.data);
    }
}
