class Parser
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def load_into(store)
    input.strip.lines(chomp: true).each{|line|
      home, away, result = line.split(';')
      case result
      when "win"
        store.record_win(home, away)
      when "loss"
        store.record_loss(home, away)
      when "draw"
        store.record_draw(home, away)
      else
        raise ArgumentError, "Unknown result: #{result}"
      end
    }
  end
end
