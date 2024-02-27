package main

import (
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/gosimple/slug"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

func main() {
	in := readStdin()

	// if -s flag is provided, convert to slug case
	if len(os.Args) > 1 && os.Args[1] == "-s" {
		fmt.Fprint(os.Stdout, Slug(in))
		return
	}

	fmt.Fprint(os.Stdout, Title(in))
}

var titleCaser = cases.Title(language.English)

// any of these term keys will be mapped to values
var mappings = map[string]string{
	"oclt":    "OCLT",
	"fd":      "FD",
	"para":    "PARA",
	"github":  "GitHub",
	"mongodb": "MongoDB",
	"cli":     "CLI",
	"nextjs":  "Next.js",
	"ssr":     "SSR",
}

// for each of these separators
// title is divided into individual terms
var separators = []string{
	" ",
	"-",
}

// Slug converts title to slug case -> slug-case
func Slug(s string) string {
	return slug.Make(s)
}

// Title converts string to title case -> Title Case
// For each separator, iterates over s splitting terms
// Converts any terms in keys of mappings to its mapped value
func Title(s string) string {
	title := titleCaser.String(s)

	for _, sep := range separators {
		title = runMappings(title, sep)
	}

	return title
}

// for each separator runMappings splits title into terms
// convert each mapped term keys to it's mapped value
func runMappings(in, separator string) string {
	var result strings.Builder

	for _, term := range strings.Split(in, separator) {
		result.WriteString(mapTerm(term) + separator)
	}

	r := strings.TrimSuffix(result.String(), separator)
	r = strings.TrimSpace(r)
	return r
}

// if there is mapping for term returns mapped value
func mapTerm(term string) string {
	t := strings.TrimSpace(strings.ToLower(term))
	if value, ok := mappings[t]; ok {
		return value
	}
	return term
}

func readStdin() string {
	in, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}
	return string(in)
}
