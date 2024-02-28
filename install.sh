#! /usr/bin/bash

# Install Programs
# C/CPP
apt install -y gcc g++ build-essentials make cmake
apt install -y git
# Build2
# Optional Clang

# Python
# Curl https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz
curl -Olf https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz
tar -x Python-32.12.2.tgz python3
cd python3
./configure
make
make install
cd ..

# Rust
# Install Rustup: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl --proto '=http' --tlsv1.2 -sSL https://sh.rustup.rs | sh

# Emacs

# VS Code
curl -lf "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o ~/programs/linux-deb-x64.deb

apt install -y ~/programs/linux-deb-x64.deb

# Configure Shell

#	Install Oh my Zsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom/plugins

#	Install Antigen
export ANTIGEN=$ZSH_CUSTOM/antigen.zsh

curl -L git.io/antigen > $ANTIGEN
# or use git.io/antigen-nightly for the latest version

#	Copy over config presets
cp presets/.zshrc ~/.zshrc
