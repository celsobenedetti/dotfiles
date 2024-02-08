package main

import (
	"fmt"
	"io"
	"os"
	"strings"

	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

func main() {
	in := readStdin()
	fmt.Fprint(os.Stdout, Title(in))
}

var titleCaser = cases.Title(language.English)

// all of these terms will be upper cased
var shouldUpper = map[string]struct{}{
	"oclt": {},
	"fd":   {},
	"para": {},
}

// for each of these separators
// title is divided into individual terms
var separators = []string{
	" ",
	"-",
}

// Title converts string to title case -> Title Case
// For each separator, iterates over s splitting terms
// Converts any terms in shouldUpper to UPPER CASE
func Title(s string) string {
	title := titleCaser.String(s)

	for _, sep := range separators {
		title = iterateTerms(title, sep)
	}

	return title
}

// iterateTerms splits strings by separator and uppters any individual terms
func iterateTerms(in, separator string) string {
	var result strings.Builder

	for _, term := range strings.Split(in, separator) {
		if _, ok := shouldUpper[strings.ToLower(term)]; ok {
			term = strings.ToUpper(term)
		}
		result.WriteString(term + separator)
	}

	return strings.Trim(result.String(), separator)
}

func readStdin() string {
	in, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}
	return string(in)
}
