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

def evaluate(tree)
  if tree[0] == "lit"
    tree[1]
  else
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    case tree[0]
    when "+"
      left + right
    when "*"
      left * right
    when "-"
      left - right
    when "/"
      left / right
    when ">"
      left > right
    when "<"
      left < right
    when "<="
      left <= right
    when ">="
      left >= right
    when "=="
      left == right
    when "%"
      left % right
    when "**"
      left ** right

    else
      p("undefined operator!!")
      p(tree[0])
    end
  end
end




expr = "2 + 1 - 100 > 10"
tree = minruby_parse(expr)
p(tree)
pp(tree)
answer = evaluate(tree)
p(answer)