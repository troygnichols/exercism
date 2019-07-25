class Series
  attr_reader :series

  def initialize(series)
    @series = series
  end

  def slices(n)
    raise ArgumentError if n > series.length
    series.scan(/\d/).each_cons(n).map(&:join)
  end
end
