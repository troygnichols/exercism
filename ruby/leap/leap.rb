class Year

  def self.leap?(yr)
    return false unless divisible_by?(yr, 4)
    if divisible_by?(yr, 100)
      return false unless divisible_by?(yr, 400)
    end
    true
  end

  class << self
    private

    def divisible_by?(dividend, divisor)
      dividend % divisor == 0
    end
  end
end
