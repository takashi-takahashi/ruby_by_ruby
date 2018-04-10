answer = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
guess = gets.to_i
if answer == guess
  p("correct!")
else
  p("incorrect!!")
end

p("answer: " + answer.to_s)
p("your guess: " + guess.to_s)
