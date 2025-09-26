# Rust environment
load_rust() {
    if [ -f "$HOME/.cargo/env" ]; then
        export PATH=$HOME/.cargo/env:$PATH
        . "$HOME/.cargo/env"
    fi
}

# DENO environment
load_deno() {
    export DENO_INSTALL="$HOME/.deno"
    if [[ ! "$PATH" =~ "$DENO_INSTALL/bin" ]]; then
        export PATH="$DENO_INSTALL/bin:$PATH"
    fi
}

load_rust
load_deno
