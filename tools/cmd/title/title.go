package main

import (
	"fmt"
	"io"
	"os"

	"golang.org/x/text/cases"
	"golang.org/x/text/language"
)

func main() {
	err := run()
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(1)
	}
}

func run() error {
	in, err := io.ReadAll(os.Stdin)
	if err != nil {
		return err
	}

	caser := cases.Title(language.English)
	out := caser.String(string(in))

	fmt.Fprint(os.Stdout, out)

	return nil
}
