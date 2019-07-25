class House

  def self.recite
    'This is the house that Jack built.' + PARAGRAPH_BREAK +
    THINGS.reduce([]) {
      |acc, (noun_phrase, verb_phrase)|
      acc << "%s\nthat %s\n%s" % [
        noun_phrase,
        [verb_phrase, $/, acc.last].join.strip
      ].join
    }.map {|phrase|
      "This is the #{phrase} the house that Jack built."
    }.join(PARAGRAPH_BREAK)
  end

  PARAGRAPH_BREAK = $/ * 2

  THINGS = <<~THINGS.chomp.split($/).each_slice(2)
    malt
    lay in
    rat
    ate
    cat
    killed
    dog
    worried
    cow with the crumpled horn
    tossed
    maiden all forlorn
    milked
    man all tattered and torn
    kissed
    priest all shaven and shorn
    married
    rooter tha crowed in the morn
    woke
    farmer sowing his corn
    kept
    horse and the hound and the horn
  THINGS
end
