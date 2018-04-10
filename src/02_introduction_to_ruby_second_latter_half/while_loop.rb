solution = 200
guess = gets.to_i

while guess != solution
  p("wrong!")
  if guess > solution
    p("larger than true value")
  else
    p("smaller than true value")
  end
  p("your guess is " + guess.to_s)
  guess = gets.to_i
end