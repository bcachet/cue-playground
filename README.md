# CUE playground

Devecontainer environment to play with CUE. You can open this project in Codespace and have everything ready to play with CUE.

## Objective

Objective is to be able to deploy an application into Kubernetes

We aim at defining our application via CUE and generate associated Kubernetes manifests out of it.

We may rely on CUE script to interact with kubectl or other tooling.


## Usage

Generate Kubernetes manifests of configured services
```shell
cue export .:services -e manifests --out yaml
```
