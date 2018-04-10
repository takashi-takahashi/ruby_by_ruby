# show name of all nodes in a tree
def preoder(tree)
  p(tree[0])
  # if tree[0].start_with?("節")
  if tree[1] != nil
    preoder(tree[1])
    preoder(tree[2])
  else
    p("leaf!")
  end

end

# make dummy data
leaf_a = ["葉A"]
leaf_b = ["葉B"]
leaf_c = ["葉C"]
leaf_d = ["葉D"]

node2 = ["節2", leaf_a, leaf_b]
node3 = ["節3", leaf_c, leaf_d]

node1 = ["節1", node2, node3]

preoder(node1)