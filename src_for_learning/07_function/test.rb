require "minruby"

expr = "
i = 0
while i < 10
  p(i)
  i = i + 1
end
"

tree = minruby_parse(expr)
pp(tree)