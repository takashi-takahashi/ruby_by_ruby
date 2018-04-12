require "minruby"


def evaluate(tree, genv, lenv)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    evaluate(tree[1], genv, lenv) + evaluate(tree[2], genv, lenv)
  when "*"
    evaluate(tree[1], genv, lenv) * evaluate(tree[2], genv, lenv)
  when "-"
    evaluate(tree[1], genv, lenv) - evaluate(tree[2], genv, lenv)
  when "/"
    evaluate(tree[1], genv, lenv) / evaluate(tree[2], genv, lenv)
  when ">"
    evaluate(tree[1], genv, lenv) > evaluate(tree[2], genv, lenv)
  when "<"
    evaluate(tree[1], genv, lenv) < evaluate(tree[2], genv, lenv)
  when "<="
    evaluate(tree[1], genv, lenv) <= evaluate(tree[2], genv, lenv)
  when ">="
    evaluate(tree[1], genv, lenv) >= evaluate(tree[2], genv, lenv)
  when "=="
    evaluate(tree[1], genv, lenv) == evaluate(tree[2], genv, lenv)
  when "%"
    evaluate(tree[1], genv, lenv) % evaluate(tree[2], genv, lenv)
  when "**"
    evaluate(tree[1], genv, lenv) ** evaluate(tree[2], genv, lenv)
  when "func_call" # fixme
    p(evaluate(tree[2], genv, lenv))
  when "var_assign"
    genv[tree[1]] = evaluate(tree[2], genv, lenv)
  when "var_ref"
    genv[tree[1]]
  when "if"
    if evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    else
      evaluate(tree[3], genv, lenv)
    end
  when "while"
    while evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    end
  when "stmts"
    i = 1
    last = nil
    while tree[i]
      last = evaluate(tree[i], genv, lenv)
      i = i + 1
    end
    last
  else
    p("unknown input")
    pp(tree)
    raise("unknown code")
  end

end

expr = minruby_load()
tree = minruby_parse(expr)

genv = {"p" => ["builtin", "p"]} # environment for function names
lenv = {} # environment for variable names
evaluate(tree, genv, lenv)