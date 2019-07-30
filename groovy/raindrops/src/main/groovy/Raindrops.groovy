class Raindrops {
  static sounds = [3: 'Pling', 5: 'Plang', 7: 'Plong']

  def convert(num) {
    sounds.findResults { factor, sound ->
      isDivisibleBy(num, factor) ? sound : null
    }.join() ?: num as String
  }

  def static isDivisibleBy(dividend, divisor) {
    dividend % divisor == 0
  }
}
