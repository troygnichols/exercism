class Squares
  attr_reader :range

  def initialize(number)
    @range = (1..number)
  end

  def square_of_sum
    @square_of_sum ||= range.sum ** 2
  end

  def sum_of_squares
    @sum_of_squares ||= range.map{|n| n ** 2}.sum
  end

  def difference
    @difference ||= square_of_sum - sum_of_squares
  end
end
