package services
import (
    resources "github.com/bcachet/cue-playground/resources"
    apps_v1 "k8s.io/api/apps/v1"
    core_v1 "k8s.io/api/core/v1"
)

vault: resources.#Service & {
    image: resources.#Image & {
        name: "hashicorp/vault"
    }
    args: [ {name: "foo", value: "bar"} ]
}

manifests: {
    for service in [vault] {
        apps_v1.#Deployment & {
            kind: "Deployment"
            spec: apps_v1.#DeploymentSpec & {
                template: {
                    spec: core_v1.#PodSpec & {
                        containers: [
                        { name: vault.image.name }]
                    }
                }
            }
        }
    }
}
