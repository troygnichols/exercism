// Package hamming has functionality related to
// computing the Hamming distance for DNA
package hamming

import "errors"

// Distance reports the Hamming distance
// between two strands of DNA
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("Bad input")
	}

	dist := 0

	runesA := []rune(a)
	runesB := []rune(b)

	for pos, runeA := range runesA {
		if runesB[pos] != runeA {
			dist++
		}
	}

	return dist, nil
}
