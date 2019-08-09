// Package raindrops has raindrop related functions.
package raindrops

import (
	"strconv"
	"strings"
)

type drop struct {
	factor int
	sound  string
}

var drops = []drop{
	drop{3, "Pling"},
	drop{5, "Plang"},
	drop{7, "Plong"},
}

// Convert takes an integer input and
// returns combinations of "Pling", "Plang" and "Plong"
// depending on whether the input was divisible evenly
// 3, 5, and 7 respectively. If not divisible by any of
// 3, 5 or 7, returns the input converted to a string.
func Convert(input int) string {
	var output []string
	for _, drop := range drops {
		if input%drop.factor == 0 {
			output = append(output, drop.sound)
		}
	}
	if len(output) == 0 {
		return strconv.Itoa(input)
	}
	return strings.Join(output, "")
}
