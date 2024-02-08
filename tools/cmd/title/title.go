package main

import (
	"fmt"
	"io"
	"os"
	"strings"

	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

var shouldUpper = map[string]struct{}{
	"oclt": {},
	"fd":   {},
}

var separators = []string{
	" ", "-",
}

func main() {
	in, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}

	title := Title(string(in))
	fmt.Fprint(os.Stdout, title)
}

// Title converts string to Title Case
// converts any strings in shouldUpper to upper case
func Title(s string) string {
	caser := cases.Title(language.English)
	out := caser.String(string(s))

	for _, sep := range separators {
		out = processUpper(out, sep)
	}

	return out
}

// processUpper splits strings by separator and process individual terms
func processUpper(in, separator string) string {
	var result strings.Builder

	for _, part := range strings.Split(in, separator) {
		if _, ok := shouldUpper[strings.ToLower(part)]; ok {
			result.WriteString(strings.ToUpper(part))
		} else {
			result.WriteString(part)
		}
		result.WriteString(separator)
	}

	return strings.Trim(result.String(), separator)
}
