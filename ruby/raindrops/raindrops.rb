class Raindrops
  FACTORS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(number)
    # FACTORS.reduce([]) { |memo, (factor, string)|
    #   number % factor == 0 ? acc << string : acc
    # }.then { |result|
    #   result.empty? ? number.to_s : result.join
    # }

    FACTORS.keys.filter {|factor, string| number % factor == 0}
      .map {|key| FACTORS[key] }
      .then { |result| result.empty? ? number.to_s : result.join }
  end
end
