#!/bin/bash

install_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "oh-my-zsh is already installed"
        return
    fi

    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_brew() {
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed!"
    fi
}

# Функция для установки Zig
install_zig() {
    if ! command -v zig &> /dev/null; then
        echo "Installing Zig..."
        brew install zig
    else
        echo "Zig is already installed!"
    fi
}

# Функция для установки Rust
install_rust() {
    if ! command -v rustup &> /dev/null; then
        echo "Устанавливаю Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    else
        echo "Rust is already installed!"
    fi
}

install_brew
install_zig
install_rust

echo "Installation done!"
