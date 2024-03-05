package main

import "testing"

func Test_Encode(t *testing.T) {
	tests := []struct {
		name string
		in   string
		want string
	}{
		{
			name: "escape brackets and parenthssis",
			in:   "http://localhost?brac=[mycoolyurl]&is=(prettyNice)",
			want: "http:%2F%2Flocalhost%3Fbrac=%5Bmycoolyurl%5D&is=%28prettyNice%29",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Encode(tt.in); got != tt.want {
				t.Errorf("encode() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_decode(t *testing.T) {
	tests := []struct {
		name string
		in   string
		want string
	}{
		{
			name: "escape brackets and parenthssis",
			in:   "http:%2F%2Flocalhost%3Fbrac=%5Bmycoolyurl%5D&is=%28prettyNice%29",
			want: "http://localhost?brac=[mycoolyurl]&is=(prettyNice)",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := Decode(tt.in); got != tt.want {
				t.Errorf("decode() = %v, want %v", got, tt.want)
			}
		})
	}
}
