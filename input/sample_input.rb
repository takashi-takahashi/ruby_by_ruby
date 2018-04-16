plus_count = 0
p(1 + 2)
p(6 * 7)
p(40 + 2)

x = 2
p(x ** 20)

answer = (1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)
p(answer)
p(plus_count)


if 0 == 0
  p(42)
else
  p(43)
end

i = 0
while i < 10
  p(i)
  i = i + 1
end

p(1, 2, 3)

hello()

def aho(x, y)
  x + y
end

x = 0

aho(1, 20)

p(aho(1, 2000))
# raise("i am your father")
def foo()
  x = 0
  p(x)
end

x = 1
foo() #=> 0
p(x) #=> 1


p("##############")

def fib(x)
  if x <= 1
    x
  else
    fib(x - 1) + fib(x - 2)
  end
end

p(fib(15))

def even?(n)
  if n == 0
    true
  else
    odd?(n - 1)
  end
end

def odd?(n)
  if n == 0
    false
  else
    even?(n - 1)
  end
end


p(even?(9))
p(odd?(9))

x = [1, 2, 3]
p(x)
p(x[2])
x[1] = 100
p(x)

hsh = {1 => 10, 2 => 20}
p(hsh[1])
p(hsh)