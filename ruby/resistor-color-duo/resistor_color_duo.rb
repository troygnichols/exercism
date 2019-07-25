class ResistorColorDuo
  COLORS = %w(black brown red orange yellow green blue violet grey white)

  attr_reader :value

  def self.value(colors)
    new(colors).value
  end

  def initialize(colors)
    @value = colors
      .map(&method(:color_value))
      .reverse
      .each_with_index
      .sum {|color_value, index| color_value * 10 ** index}
  end

  private

  def color_value(color)
    COLORS.index(color) or raise ArgumentError, "Bad color: #{color}"
  end
end
