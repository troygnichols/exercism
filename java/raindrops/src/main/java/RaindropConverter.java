import java.util.List;

class RaindropConverter {

  private static final List<Factor> FACTORS = List.of(
          new Factor(3, "Pling"),
          new Factor(5, "Plang"),
          new Factor(7, "Plong")
  );

  String convert(int number) {
    StringBuilder res = new StringBuilder();

    for (Factor f : FACTORS) {
      if (isFactor(number, f.number)) {
        res.append(f.word);
      }
    }

    if (0 == res.length()) {
      res.append(number);
    }

    return res.toString();
  }

  private static boolean isFactor(int number, int factor) {
    return number % factor == 0;
  }

  private static class Factor {
    public final int number;
    public final String word;

    public Factor(int number, String word) {
      this.number = number;
      this.word = word;
    }
  }

}

