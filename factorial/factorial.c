// Returns -1 if there is an error
unsigned long factorial(int n) {
  int i;
  unsigned long result = 1;

  if (n == 0) {
    return result;
  }

  // Factorial is undefined for negative numbers
  if (n < 0) {
    return -1;
  }

  // unsigned long cannot hold an integer larger than 23!  At 24! we overflow
  if (n >= 24) {
    return -1;
  }

  for (i = 1; i <= n; i++) {
    result = result * i;
  }

  return result;
}
