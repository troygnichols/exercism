require_relative 'parser'
require_relative 'formatter'

class Tournament
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def tally
    records = Parser.parse(input)
    Formatter.new(records).format
  end

  def self.tally(input)
    new(input).tally
  end
end
