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

# make dummy data
leaf_a = ["葉A"]
leaf_b = ["葉B"]
leaf_c = ["葉C"]
leaf_d = ["葉D"]

node3 = ["節3", leaf_b, leaf_c]
node2 = ["節2", leaf_a, node3]
node1 = ["節1", node2, leaf_d]

show_leafs(node1)