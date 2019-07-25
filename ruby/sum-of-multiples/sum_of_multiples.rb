module MultiplesRefinements
  refine Numeric do
    def multiple_of?(candidate)
      self.modulo(candidate).zero?
    end
  end
end

class SumOfMultiples
  using MultiplesRefinements

  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(bound)
    (1...bound).select { |number|
      multiples.any? {|multiple|
        number.multiple_of?(multiple)}
    }.sum
  end
end
