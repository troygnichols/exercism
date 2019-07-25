module PokerPatches
  refine Array do
    def consecutive?
      each_cons(2).all? {|a,b| b == a+1}
    end
  end
end

class Card
  RANK_MAP = {'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }.freeze
  SUIT_MAP = {'S' => '♠', 'H' => '♥', 'D' => '♠', 'C' => '♣'}.freeze

  attr_reader :suit, :rank, :display

  def initialize(card_string)
    @display = parse_display(card_string)
    @rank = parse_rank(card_string)
    @suit = parse_suit(card_string)
  end

  def inspect; display end

  private

  def parse_display(card_string)
    rank = card_string[0..-2]
    suit = parse_suit(card_string)
    "%s%s" % [rank, SUIT_MAP[suit] || suit]
  end

  def parse_rank(card_string)
    str = card_string[0..-2]
    RANK_MAP[str] || str.to_i
  end

  def parse_suit(card_string)
    card_string[-1]
  end
end

class Hand
  # Scoring for comparison between hands:
  # 1-14 High card
  # 100-114 One pair
  # 200-214 Two pair
  # 300-314 Three of a kind
  # 400-414 Straight
  # 500-514 Flush
  # 600-614 Full house
  # 700-714 Four of kind
  # 800-814 Straight flush

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def score
    [ StraightFlush, FourOfAKind, FullHouse, Flush,
      Straight, ThreeOfAKind, TwoPair, OnePair ]
      .each {|hand_class|
        score = hand_class.new(cards).score
        break score if score > 0
    }
  end

  def ranks; cards.map(&:rank) end

  def suits; cards.map(&:suit).uniq end
end

class StraightFlush < Hand
  using PokerPatches

  BASE_SCORE = 800

  def score
    ranks.sort.consecutive? && suits.one? ? BASE_SCORE + ranks.max : 0
  end
end

class FourOfAKind < Hand
  BASE_SCORE = 700

  def score
    ranks
      .group_by(&:itself)
      .find {|rank, cards| cards.count == 4}
      .then {|rank, _count| rank ? BASE_SCORE + rank : 0}
  end
end

class FullHouse < Hand
  BASE_SCORE = 600

  def score
    ranks
      .group_by(&:itself)
      .values
      .map(&:count)
      .sort
      .then {|counts|
        counts == [2,3] ? BASE_SCORE : 0
    }
  end
end

class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = hands.map {|cards_strings|
      Hand.new(
        cards_strings.map {|s| Card.new(s)}
      )
    }
  end

  def best_hand
    hands.map(&:sore).last
  end
end
