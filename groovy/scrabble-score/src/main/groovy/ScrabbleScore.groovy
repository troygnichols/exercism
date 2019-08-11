class ScrabbleScore {

  static scoreWord(String word) {
    def score = 0
    word.toLowerCase().each { ch ->
      score += scoreChar(ch)
    }
    score
  }

  static scoreChar(String ch) {
    switch (ch) {
      case "d":
      case "g":
        return 2;

      case "b":
      case "c":
      case "m":
      case "p":
        return 3;

      case "f":
      case "h":
      case "v":
      case "w":
      case "y":
        return 4;

      case "k":
        return 5;

      case "j":
      case "x":
        return 8;

      case "q":
      case "z":
        return 10;

      default:
        return 1;
    }
  }
}
