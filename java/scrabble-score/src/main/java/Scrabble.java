class Scrabble {

    private final String word;
    private final Integer score;

    Scrabble(String word) {
        this.word = word;
        this.score = calcScore();
    }

    int getScore() {
        return this.score;
    }

    private int calcScore() {
        return word.toLowerCase().chars().reduce(0, (acc, ch) ->
                acc + charScore(ch));
    }

    private static int charScore(int ch) {
        switch (ch) {
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
            case 'l':
            case 'n':
            case 'r':
            case 's':
            case 't':
                return 1;

            case 'd':
            case 'g':
                return 2;

            case 'b':
            case 'c':
            case 'm':
            case 'p':
                return 3;

            case 'f':
            case 'h':
            case 'v':
            case 'w':
            case 'y':
              return 4;

            case 'k':
                return 5;

            case 'j':
            case 'x':
                return 8;

            case 'q':
            case 'z':
                return 10;

            default:
                throw new IllegalArgumentException("Invalid character: " + ch);
        }
    }

}
