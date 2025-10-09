# rust-wasm-pack-action

A GitHub Action to build Rust WebAssembly packages using `wasm-pack`.

## Usage

```yaml
- uses: michaelpeterswa/rust-wasm-pack-action@v1
  with:
    path: '.'
```

## Features

- Built on `rust:1-slim-bookworm` (Debian-based)
- Installs `wasm-pack` automatically
- Runs `wasm-pack build` on your Rust project

## Inputs

- `path` - Path to the Rust project directory (default: `.`)

## Environment

- Base image: `rust:1-slim-bookworm`
- Includes: `curl`, `ca-certificates`, and `wasm-pack`
