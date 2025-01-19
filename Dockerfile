FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

## Configure vscode user
USER vscode

ARG GOLANG_VERSION=1.22.11
WORKDIR /home/vscode/
## Golang environment
RUN <<EOF
curl -L https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz -o go${GOLANG_VERSION}.linux-amd64.tar.gz
tar -C . -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz
EOF

ENV PATH=/home/vscode/go/bin:$PATH

ARG DELVE_VERSION=v1.24.0
ARG GOPLS_VERSION=latest
RUN <<EOF
go install github.com/go-delve/delve/cmd/dlv@${DELVE_VERSION}
go install golang.org/x/tools/gopls@${GOPLS_VERSION}
EOF

ARG CUELANG_VERSION=v0.11.1
### Install CUE
RUN go install cuelang.org/go/cmd/cue@${CUELANG_VERSION}

## Install HOF
ARG HOF_VERSION=v0.6.9
RUN <<EOF
git clone https://github.com/hofstadter-io/hof /tmp/hof
cd /tmp/hof
git checkout ${HOF_VERSION}
make hof
EOF
