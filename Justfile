set shell := ["bash", "-euo", "pipefail", "-c"]

wasm_tools := env_var_or_default("WASM_TOOLS", "wasm-tools")
sigil := env_var_or_default("SIGIL", "sigil")

build:
    mkdir -p build
    {{wasm_tools}} component embed wit/codec.wit --world codec-plugin src/codec.core.wat -o build/codec.embedded.wasm
    {{wasm_tools}} component new build/codec.embedded.wasm -o plugin.wasm
    {{wasm_tools}} component targets wit/codec.wit --world sigil:plugins/codec-plugin@1.0.0 plugin.wasm

check: build
    {{sigil}} plugin validate plugin.toml
    {{sigil}} plugin inspect plugin.toml --format json

dist: check
    mkdir -p dist
    {{sigil}} plugin pack plugin.toml --output-dir dist

