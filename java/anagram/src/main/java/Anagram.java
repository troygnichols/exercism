import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Anagram {

  private final String word;

  public Anagram(String word) {
    this.word = word;
  }

  List<String> match(List<String> candidates) {
    return candidates.stream()
            .filter(this::isAnagram)
            .collect(Collectors.toList());
  }

  boolean isAnagram(String candidate) {
    if (this.word.equalsIgnoreCase(candidate)) {
      return false;
    }

    return Arrays.equals(
            asSortedArray(candidate),
            asSortedArray(this.word)
    );
  }

  private static char[] asSortedArray(String str) {
    char[] temp = str.toLowerCase().toCharArray();
    Arrays.sort(temp);
    return temp;
  }
}
