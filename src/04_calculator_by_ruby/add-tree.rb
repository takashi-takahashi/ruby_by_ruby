require "minruby"

def sum(tree)
  if tree[0] == "lit"
    tree[1]
  else
    left = sum(tree[1])
    right = sum(tree[2])
    left + right
  end

end

# expr = gets
expr = "((1 + 2) + (3 + 4) + 6 + (((1))) ) + 10"
p("expr = " + expr.to_s)
tree = minruby_parse(expr)
p("tree = ")
pp(tree)

answer = sum(tree)
p(answer)