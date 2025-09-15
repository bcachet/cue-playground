package services
import (
    resources "github.com/bcachet/cue-playground/resources"
)

deployments: vault: resources.#Service & {
    image: resources.#Image & {
        name: "hashicorp/vault"
        tag: "2.0.0"
    }
    probes: {
        health: {

        }
    }
}
