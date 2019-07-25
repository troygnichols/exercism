class Sieve
  attr_reader :bound

  def initialize(n)
    @bound = n
  end

  def primes
    initial = (2..bound).to_a

    (2..).reduce(initial) do |acc, n|
      break acc if (n * n) > bound
      acc - ((n+n)..bound).step(n).to_a
    end
  end
end
