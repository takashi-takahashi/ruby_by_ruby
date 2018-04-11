# show name of all nodes in a tree
def preoder(tree)
  p(tree[0])
  # if tree[0].start_with?("節")
  if tree[1] != nil
    preoder(tree[1])
    preoder(tree[2])
  else
    # p("leaf!")
  end
end

# show name of all nodes in a tree
def show_leafs(tree)

  if tree[0].start_with?("葉")
    p(tree[0])
  end

  if tree[1] != nil
    show_leafs(tree[1])
    show_leafs(tree[2])
  end
end

# postorder
def postorder(tree)
  if tree[1] != nil
    postorder(tree[1])
    postorder(tree[2])
  end
  p(tree[0])
end

leaf_a = ["葉A"]
leaf_b = ["葉B"]
leaf_c = ["葉C"]
leaf_d = ["葉D"]

node2 = ["節2",leaf_a, leaf_b]
node3 = ["節3",leaf_c, leaf_d]
node1 = ["節1",node2,node3]
# show_leafs(node1)
postorder(node1)