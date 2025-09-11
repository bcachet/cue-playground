package foo

import (
	"tool/exec"
	resources "github.com/bcachet/cue-playground/resources"
)

// A command named "podman"
command: podman: {

	var: {
		service: resources.#Service & {
			image: resources.#Image & {
				name: "hashicorp/vault"
			}
		}
	}

	pull: exec.Run & {
		cmd: ["docker", "pull", var.service.image.name]
		stdout: string // capture stdout, don't print to the terminal
	}
}
