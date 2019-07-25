// Package twofer has functionality related to saying
// things about how many each person has
package twofer

import "fmt"

// ShareWith returns a happy string with an optional name,
// defaulting to "you" if absent
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
