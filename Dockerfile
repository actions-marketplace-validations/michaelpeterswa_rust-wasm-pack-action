# -=-=-=-=-=-=- Setup Rust Build Container -=-=-=-=-=-=-

FROM rust:1-slim-bookworm AS rust-setup

# Set GitHub Actions Metadata
LABEL "com.github.actions.name"="Rust 'wasm-pack' Action"
LABEL "com.github.actions.description"="GitHub action to wasm-pack a Rust project"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

# Set Repository Metadata
LABEL version="1.0.0"
LABEL repository="https://github.com/michaelpeterswa/rust-wasm-pack-action"
LABEL maintainer="Michael Peters <michael@michaelpeterswa.com>"

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]