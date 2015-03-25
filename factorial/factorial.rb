def factorial n
  raise ArgumentError, "Factorial of a negative number is undefined" if n < 0
  return 1 if n == 0

  (1..n).inject(1) do |factorial, i|
    factorial *= i
  end
end
