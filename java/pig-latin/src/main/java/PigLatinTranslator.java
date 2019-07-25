import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class PigLatinTranslator {

  private static final String REGEX =
          "([^aeiouy]*qu[^aeiouy]*|y(?!t)|x(?!r)|[^aeiouyx]*)([aeiouyx]\\w*)";


  String translate(String in) {
    List words = Arrays.asList(in.split("\\s"))
            .stream()
            .map(this::translateWord)
            .collect(Collectors.toList());

    return String.join(" ", words);
  }

  String translateWord(String in) {
    return in.replaceAll(REGEX, "$2$1ay");
  }
}
