class Palindromes
  class Combo
    include Comparable

    attr_reader :value, :factors

    def initialize(value, factors)
      @value, @factors = value, factors
    end

    def <=>(other)
      value <=> other.value
    end
  end

  attr_reader :max_factor, :min_factor

  def initialize(max_factor:, min_factor: 1)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def generate; palindromes end

  def largest
    @largest ||= palindromes.max
  end

  def smallest
    @smallest ||= palindromes.min
  end

  private

  def factor_pairs
    @factor_pairs ||=
      begin
        nums = (min_factor..max_factor).to_a
        nums.product(nums)
      end
  end

  def palindromes
    factor_pairs.each_with_object(Hash.new{|h,k| h[k]=[]}) {
      |pair, cache|
      product = pair.reduce(:*)
      next unless palindrome?(product)
      cache[product] << pair
    }
      .map {|val, facs| Combo.new(val, facs)}
  end

  def palindrome?(n)
    n.digits == n.digits.reverse
  end
end
