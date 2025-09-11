import (
    resources "github.com/bcachet/cue-playground/resources"
)

resources.#Service & {
    image: resources.#Image & {
        name: "hashicorp/vault"
    }
}
