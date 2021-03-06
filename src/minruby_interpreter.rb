require("minruby")


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
  when "func_call"
    args = []
    i = 0
    while tree[i + 2]
      args[i] = evaluate(tree[i + 2], genv, lenv)
      i = i + 1
    end
    mhd = genv[tree[1]] # function type
    if mhd[0] == "builtin"
      minruby_call(mhd[1], args)
    else
      new_lenv = {}
      params = mhd[1]
      i = 0
      while params[i]
        new_lenv[params[i]] = args[i]
        i = i + 1
      end
      evaluate(mhd[2], genv, new_lenv)
    end

  when "func_def"
    genv[tree[1]] = ["user_defined", tree[2], tree[3]]

  when "var_assign"
    lenv[tree[1]] = evaluate(tree[2], genv, lenv)
  when "var_ref"
    lenv[tree[1]]
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
  when "ary_new"
    ary = [] # new array
    i = 0
    while tree[i + 1]
      ary[i] = evaluate(tree[i + 1], genv, lenv)
      i = i + 1
    end
    ary
  when "ary_ref"
    ary = evaluate(tree[1], genv, lenv)
    index = evaluate(tree[2], genv, lenv)
    ary[index]
  when "ary_assign"
    ary = evaluate(tree[1], genv, lenv)
    idx = evaluate(tree[2], genv, lenv)
    val = evaluate(tree[3], genv, lenv)
    ary[idx] = val

  when "hash_new"
    hsh = {}
    i = 0
    while tree[i + 1]
      key = evaluate(tree[i + 1], genv, lenv)
      val = evaluate(tree[i + 2], genv, lenv)
      i = i + 2
      hsh[key] = val
    end
    hsh


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

def hello()
  p("hello world")
end

genv = {
    "p" => ["builtin", "p"],
    "raise" => ["builtin", "raise"],
    "require" => ["builtin", "require"],
    "minruby_parse" => ["builtin", "minruby_parse"],
    "minruby_load" => ["builtin", "minruby_load"],
    "minruby_call" => ["builtin", "minruby_call"],
    "hello" => ["builtin", "hello"]
} # environment for function names
lenv = {} # environment for variable names
evaluate(tree, genv, lenv)