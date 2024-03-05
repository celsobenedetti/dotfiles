package main

import (
	"flag"
	"fmt"
	"io"
	"log"
	"net/url"
	"os"
)

var decodeFlag = flag.Bool("d", false, "should decode url")

func main() {
	flag.Parse()
	in := readStdin()

	if *decodeFlag {
		fmt.Println(Decode(in))
	} else {
		fmt.Println(Encode(in))
	}
}

func Encode(s string) string {
	return url.PathEscape(s)
}

func Decode(s string) string {
	out, err := url.PathUnescape(s)
	if err != nil {
		log.Fatalln("failed to decode", s, err)
	}
	return out
}

func readStdin() string {
	in, err := io.ReadAll(os.Stdin)
	if err != nil {
		log.Fatalln("failed to read stdin", err)
	}
	return string(in)
}
