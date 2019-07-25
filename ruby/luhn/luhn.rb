module LuhnPatches
  refine Numeric do
    def luhn_double
      n = self * 2
      n > 9 ? n - 9 : n
    end

    def divisible_by?(n)
      self % n == 0
    end
  end
end

class Luhn
  using LuhnPatches

  attr_reader :input

  def initialize(input)
    @input = input.to_s
  end

  def valid?
    return false unless numeric?
    return false unless numbers.length > 1
    return luhn_sequence.sum.divisible_by?(10)
  end

  def self.valid?(input)
    new(input).valid?
  end

  private

  def numeric?
    /\A(?:\d|\s)+\z/.match?(input)
  end

  def numbers
    @numbers ||= input.scan(/\w/).map(&:to_i)
  end

  def luhn_sequence
    numbers
      .reverse
      .map
      .with_index {|num, index| index.odd? ? num.luhn_double : num}
  end
end
