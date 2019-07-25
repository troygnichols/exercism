class TwelveDays

  GIFTS = [
    'a Partridge in a Pear Tree', 'two Turtle Doves', 'three French Hens',
    'four Calling Birds', 'five Gold Rings', 'six Geese-a-Laying',
    'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing',
    'ten Lords-a-Leaping', 'eleven Pipers Piping', 'twelve Drummers Drumming'
  ]

  ORDINALS = %w(first second third fourth fifth sixth
                seventh eighth ninth tenth eleventh twelfth)

  class << self
    def song
      days.map(&method(:verse)).join("\n")
    end

    def verse(day)
      "On the %s day of Christmas my true love gave to me: %s.\n" %
        [ordinal(day), sentence(gifts(day))]
    end

    def days
      (1..12)
    end

    def gifts(day)
      GIFTS.take(day).reverse
    end

    def ordinal(day)
      ORDINALS.at(day - 1)
    end

    def sentence(items)
      return items.first if items.one?
      *items, last = items
      "%s, and %s" % [ items.join(', '), last ]
    end
  end
end
