require "minruby"


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

expr = minruby_load()
tree = minruby_parse(expr)
