FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

## Configure vscode user
USER vscode

ARG GOLANG_VERSION=1.22.11
WORKDIR /home/vscode/
## Golang environment
ADD --chown=vscode:vscode https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz /tmp/go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN tar -C . -xzf /tmp/go${GOLANG_VERSION}.linux-amd64.tar.gz

ENV PATH=/home/vscode/go/bin:$PATH
ENV GOCACHE=/home/vscode/.cache/go-build

ARG DELVE_VERSION=v1.24.0
ARG GOPLS_VERSION=latest
RUN --mount=type=cache,target=${GOCACHE},uid=1000,gid=1000 <<EOF
go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}
go install golang.org/x/tools/gopls@${GOPLS_VERSION}
EOF

ARG CUELANG_VERSION=v0.11.1
### Install CUE
RUN --mount=type=cache,target=${GOCACHE},uid=1000,gid=1000 \
    go install cuelang.org/go/cmd/cue@${CUELANG_VERSION}

## Install HOF
ARG HOF_VERSION=v0.6.9
ADD --chown=vscode:vscode --chmod=0555 https://github.com/hofstadter-io/hof/releases/download/${HOF_VERSION}/hof_${HOF_VERSION}_linux_amd64 /usr/bin/hof

WORKDIR /home/vscode
