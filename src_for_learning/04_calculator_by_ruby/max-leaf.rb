require "minruby"

def max_tree(tree)
  if tree[0] == "lit"
    tree[1]
  else
    left = max_tree(tree[1])
    right = max_tree(tree[2])
    if left <= right
      right
    else
      left
    end
  end
end


# expr = "1 + 2 * 3"
expr = "1 + 4 * 3"

tree = minruby_parse(expr)
result = max_tree(tree)
p(result)