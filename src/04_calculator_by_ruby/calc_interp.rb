require "minruby"

tree = minruby_parse("1 + 2 * 4")
p(tree)
pp(tree)

tree = minruby_parse("(1 + 2 / (3 + 4 + 4 * 2) ) * 2")
p(tree)
pp(tree)