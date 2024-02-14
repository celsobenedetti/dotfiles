package main

import (
	"fmt"
	"testing"
)

func TestTitle(t *testing.T) {
	titleTests := []struct {
		in   string
		want string
	}{
		{in: "my cool title", want: "My Cool Title"},
		{in: "mY cOOl TiTLE", want: "My Cool Title"},
		{in: "oclt-1234", want: "OCLT-1234"},
		{in: "ocLT-1234", want: "OCLT-1234"},
		{in: "fd-1234", want: "FD-1234"},
		{in: "fD-1234", want: "FD-1234"},
		{in: "8 - extending para across multiple platforms", want: "8 - Extending PARA Across Multiple Platforms"},
		{in: "my title for Mongodb ", want: "My Title For MongoDB"},
		{in: "my title for github ", want: "My Title For GitHub"},
		{in: "Oclt-2203 title title", want: "OCLT-2203 Title Title"},
		{in: "calendar cli", want: "Calendar CLI"},
	}
	for i, tt := range titleTests {
		t.Run(fmt.Sprintf("Test %d", i), func(t *testing.T) {
			if got := Title(tt.in); got != tt.want {
				t.Errorf("got = %v, want %v", got, tt.want)
			}
		})
	}

	slugTests := []struct {
		in   string
		want string
	}{
		{in: "my cool title", want: "my-cool-title"},
	}
	for i, tt := range slugTests {
		t.Run(fmt.Sprintf("Test %d", i), func(t *testing.T) {
			if got := Slug(tt.in); got != tt.want {
				t.Errorf("got = %v, want %v", got, tt.want)
			}
		})
	}
}
