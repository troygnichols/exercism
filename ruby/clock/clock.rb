class Clock
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = 1440

  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = (minute + MINUTES_PER_HOUR * hour).modulo(MINUTES_PER_DAY)
  end

  def to_s
    '%02d:%02d' % minutes.divmod(MINUTES_PER_HOUR)
  end

  def ==(other)
    self.minutes == other.minutes
  end
  alias eql? ==

  def hash
    [self.class, minutes].hash
  end

  def +(other)
    self.class.new(minute: self.minutes + other.minutes)
  end

  def -(other)
    self.class.new(minute: self.minutes - other.minutes)
  end
end
