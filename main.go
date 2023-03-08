// The main package processing the configuration and running the client
// test change
package main

import (
	"github.com/g-bgg/netassertv2client/cmd"

	_ "go.uber.org/automaxprocs"
)

func main() {
	cmd.Execute()
}
