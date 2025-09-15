package services
import (
    apps_v1 "k8s.io/api/apps/v1"
    core_v1 "k8s.io/api/core/v1"
    resources "github.com/bcachet/cue-playground/resources"
)

deployments: [string]: resources.#Service

manifests: {
    for x, deployment in deployments {
        apps_v1.#Deployment & {
            kind: "Deployment"
            spec: apps_v1.#DeploymentSpec & {
                template: {
                    spec: core_v1.#PodSpec & {
                        containers: [
                        { 
                            name: x
                            image: "\(deployment.image.registry)/\(deployment.image.name):\(deployment.image.tag)"
                        }
                        ]
                    }
                }
            }
        }
    }
}
