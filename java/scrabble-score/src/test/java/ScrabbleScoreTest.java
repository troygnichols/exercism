import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import static org.junit.Assert.assertEquals;

public class ScrabbleScoreTest {

    @Test
    public void testALowerCaseLetter() {
        Scrabble scrabble = new Scrabble("a");
        assertEquals(1, scrabble.getScore());
    }

   
    @Test
    public void testAUpperCaseLetter() {
        Scrabble scrabble = new Scrabble("A");
        assertEquals(1, scrabble.getScore());
    }

   
    @Test
    public void testAValuableLetter() {
        Scrabble scrabble = new Scrabble("f");
        assertEquals(4, scrabble.getScore());
    }

   
    @Test
    public void testAShortWord() {
        Scrabble scrabble = new Scrabble("at");
        assertEquals(2, scrabble.getScore());
    }

   
    @Test
    public void testAShortValuableWord() {
        Scrabble scrabble = new Scrabble("zoo");
        assertEquals(12, scrabble.getScore());
    }

   
    @Test
    public void testAMediumWord() {
        Scrabble scrabble = new Scrabble("street");
        assertEquals(6, scrabble.getScore());
    }

   
    @Test
    public void testAMediumValuableWord() {
        Scrabble scrabble = new Scrabble("quirky");
        assertEquals(22, scrabble.getScore());
    }

   
    @Test
    public void testALongMixCaseWord() {
        Scrabble scrabble = new Scrabble("OxyphenButazone");
        assertEquals(41, scrabble.getScore());
    }

   
    @Test
    public void testAEnglishLikeWord() {
        Scrabble scrabble = new Scrabble("pinata");
        assertEquals(8, scrabble.getScore());
    }

   
    @Test
    public void testAnEmptyInput() {
        Scrabble scrabble = new Scrabble("");
        assertEquals(0, scrabble.getScore());
    }

   
    @Test
    public void testEntireAlphabetAvailable() {
        Scrabble scrabble = new Scrabble("abcdefghijklmnopqrstuvwxyz");
        assertEquals(87, scrabble.getScore());
    }

    @Rule
    public ExpectedException exceptionRule = ExpectedException.none();

    @Test
    public void testWeirdCharacter() {
        exceptionRule.expect(IllegalArgumentException.class);
        exceptionRule.expectMessage("Invalid character: 1092");
        new Scrabble("ф");
    }
}
