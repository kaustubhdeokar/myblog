---
layout: post
title: Find Leaves of Trees - Google interview question.
categories: trees
---

> Google interview question, let's gooooo
      
        Problem Statement.

        So given a tree,
         - continue until tree is empty.
             - print out leaves for the tree
             - remove the leaves.

            1
         /     \
        2       5
      /  \
     3    4

     so first -> 3,4,5
     then -> 2
     then -> 1

     output: {{3,4,5},{2},{1}}


    Approach - it's finding out the maximum height of a node.
    3,4,5 have height of 0.
    2 has height of 1.
    1 has height 2.

### Code

```

    public ArrayList<ArrayList<Integer>> findLeaves(@NotNull TreeNode node) {

        ArrayList<ArrayList<Integer>> list = new ArrayList<>();
        heightTraversal(node, list);
        return list;
    }

//height traversal.

    public int heightTraversal(@Nullable TreeNode node, ArrayList<ArrayList<Integer>> list) {

        if (node == null) {
            return 0;
        }

        int left = heightTraversal(node.left, list);
        int right = heightTraversal(node.right, list); //traversing to find the height.

        int height = Integer.max(left, right);
        insertIntoList(list, height, node.val);
        return height + 1;
    }


//simple insert into a 2-d arraylist.

    private void insertIntoList(ArrayList<ArrayList<Integer>> list, int height, int val) {
        if (list.size() <= height) {
            for (int i = 0; i <= (height - list.size()); i++) {
                list.add(new ArrayList<>());
            }
        }
        list.get(height).add(val);
    }


    public static void main(String[] args) {

        SerializeDeserialize sd = new SerializeDeserialize();
        Integer[] treeStructure = {1, 2, 3, 4, 5, -1, -1, -1, -1, -1, -1};
        TreeNode root = sd.createTreeFromArray(treeStructure);
        FindLeavesOfTree fl = new FindLeavesOfTree();
        ArrayList<ArrayList<Integer>> leaves = fl.findLeaves(root);
        System.out.println(leaves);

        treeStructure = new Integer[]{1, 2, 3, -1, -1, -1, -1};
        root = sd.createTreeFromArray(treeStructure);
        fl = new FindLeavesOfTree();
        leaves = fl.findLeaves(root);
        System.out.println(leaves);

        treeStructure = new Integer[]{1, -1, -1};
        root = sd.createTreeFromArray(treeStructure);
        fl = new FindLeavesOfTree();
        leaves = fl.findLeaves(root);
        System.out.println(leaves);


    }
```


