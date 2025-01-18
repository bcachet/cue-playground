FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

## Setup
RUN apt-get update

## Golang environment
RUN apt-get install -y --no-install-recommends \
        golang=2:1.22~2build1 \
        gopls=1:0.18.0+ds-1ubuntu0.24.04.2 \
        delve=1.22.1-1

## Cleanup
RUN rm -rf /var/lib/apt/lists/*

## Configure vscode user
USER vscode

### Install CUE
RUN go install cuelang.org/go/cmd/cue@latest
ENV PATH=/home/vscode/go/bin:$PATH