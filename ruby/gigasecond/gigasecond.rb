class Gigasecond

  GIGA = 1_000_000_000

  def self.from(t)
    Time.at(t.to_i + GIGA)
  end

end
