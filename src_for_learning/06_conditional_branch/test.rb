require "minruby"

expr = "
if 0 == 0
  p(42)
else
  p(43)
end

x = 1
"

tree = minruby_parse(expr)
pp(tree)