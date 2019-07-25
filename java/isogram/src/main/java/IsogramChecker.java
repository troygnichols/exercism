import java.util.HashSet;
import java.util.Set;

class IsogramChecker {

    boolean isIsogram(String phrase) {
        Set<Character> seen = new HashSet<>();
        for (char c : prepare(phrase)) {
            if (seen.contains(c)) {
                return false;
            } else {
                seen.add(c);
            }
        }
        return true;
    }

    private static char[] prepare(String phrase) {
        return phrase
                .toLowerCase()
                .replaceAll("[^a-z]", "")
                .toCharArray();
    }

}
