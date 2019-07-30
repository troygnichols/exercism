require_relative 'parser'
require_relative 'formatter'

class Tournament
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def tally
    Formatter.new(records).format
  end

  def self.tally(input)
    new(input).tally
  end

  private

  def records
    Parser.parse(input)
  end
end
