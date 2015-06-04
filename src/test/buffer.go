package main

import (
	"os"
	"fmt"
	"bufio"
)


func main() {
	for{
		b := make([]byte, 1)
		r := bufio.NewReader(os.Stdin)
		r.Read(b)
		fmt.Print(string(b))
	}
}
