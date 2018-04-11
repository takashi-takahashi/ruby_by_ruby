require "minruby"

expr = "1==2"
tree = minruby_parse(expr)
pp(tree)

expr = "1>=2"
tree = minruby_parse(expr)
pp(tree)