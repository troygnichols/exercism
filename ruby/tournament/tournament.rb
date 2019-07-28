require_relative 'team_record'
require_relative 'data_store'
require_relative 'parser'
require_relative 'formatter'

class Tournament
  attr_reader :store

  def initialize(input)
    @store = DataStore.new
    Parser.new(input).load_into(store)
  end

  def tally
    Formatter.new(store).format
  end

  def self.tally(input)
    new(input).tally
  end
end
