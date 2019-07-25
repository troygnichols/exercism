class Pangram

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.freeze

  def self.pangram?(sentence)
    sentence.downcase.scan(/[a-z]/).sort.join.squeeze == ALPHABET
  end
end
