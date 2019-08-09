class DifferenceOfSquaresCalculator {

  /*
   * Compute the square of the sum of a series of
   * numbers ranging from 1 up to the given number, e.g.
   * Given: 5,
   * computes the square of
   * 1 + 2 + 3 + 4 + 5 = 15 ^ 2 = 225
   * Uses the formula:
   * sum = n(n+1) / 2
   * See: https://brilliant.org/wiki/sum-of-n-n2-or-n3/
   */
  int computeSquareOfSumTo(final int input) {
    final int sum = input * (input + 1) / 2;
    return (int) Math.pow(sum, 2);
  }

  /*
   * Compute the sum of squares of a series of numbers ranging
   * from 1 up to the given number, e.g., Given 5:
   * computes the sum of
   * (1^1=1 + 2^2=4 + 3^2=9 + 4^2=16 + 5^2=25) = 55
   * Uses the formula:
   * sum = (n(n+1)(2n+1)) / 6
   * See: https://brilliant.org/wiki/sum-of-n-n2-or-n3/
   */
  int computeSumOfSquaresTo(final int input) {
    return input * (input + 1) * (2 * input + 1) / 6;
  }

  /*
   * Given a number, computes the difference between its
   * square of sums and its sum of squares, e.g.
   * Given: 5,
   * subtracts sum of squares (55) from square of sums (225)
   * yielding 170
   */
  int computeDifferenceOfSquares(final int input) {
    return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
  }

}
