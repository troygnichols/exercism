package hamming

import "errors"

// Distance reports the Hamming distance
// between two strands of DNA
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("Bad input")
	}
	dist := 0
	runes_b := []rune(b)
	for pos, rune_a := range a {
		if runes_b[pos] != rune_a {
			dist++
		}
	}
	return dist, nil
}
