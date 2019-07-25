class SpaceAge

  EARTH_ORBITAL_PERIOD_SECONDS = 31557600.0

  PLANET_TO_ORBIT_RATIO = {
    earth:   1.0,
    mercury: 0.2408467,
    venus:   0.61519726,
    mars:    1.8808158,
    jupiter: 11.862615,
    saturn:  29.447498,
    uranus:  84.016846,
    neptune: 164.79132,
  }.freeze

  attr_accessor :age

  def initialize(age)
    @age = age
  end

  PLANET_TO_ORBIT_RATIO.each do |planet, ratio|
    define_method "on_#{planet}" do
      age / EARTH_ORBITAL_PERIOD_SECONDS / ratio
    end
  end

end
