package scrabble

import "strings"

// Score computes the Scrabble score for a given word.
func Score(input string) int {
	score := 0
	for _, char := range strings.ToUpper(input) {
		score += ScoreChar(char)
	}
	return score
}

// ScoreChar computes the Scrabble score for any one character.
func ScoreChar(character rune) int {
	switch character {
	case 'D', 'G':
		return 2
	case 'B', 'C', 'M', 'P':
		return 3
	case 'F', 'H', 'V', 'W', 'Y':
		return 4
	case 'K':
		return 5
	case 'J', 'X':
		return 8
	case 'Q', 'Z':
		return 10
	default:
		return 1
	}
}
