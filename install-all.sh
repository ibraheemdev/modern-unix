#!/bin/bash

# Enable bash safe mode from http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

sudo apt update

# Ensure deps
## golang
if ! command -v go &> /dev/null
then
    echo "go (golang) could not be found, install at https://golang.org/doc/install or run"
    echo "sudo apt install -y golang"
    echo "Also, ensure ~/go/bin/ is in your PATH variable"
    exit
fi

if ! command -v cargo &> /dev/null
then
    echo "cargo (rust) could not be found, install at https://doc.rust-lang.org/cargo/getting-started/installation.html or run"
    echo "sudo apt install -y cargo"
    echo "Also, ensure ~/.cargo/bin/ is in your PATH variable"
    exit
fi

if ! command -v docker &> /dev/null
then
    echo "docker could not be found, install at https://docs.docker.com/engine/install/ubuntu/"
    exit
fi




# exa
# sudo apt install -y exa
if command -v exa &> /dev/null
then
    echo "exa already installed"
else
    cargo install exa
fi

# xh
if command -v xh &> /dev/null
then
    echo "xh already installed"
else
    curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
fi


# mcfly
if command -v mcfly &> /dev/null
then
    echo "mcfly already installed"
else
    curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly --force
    echo 'eval "$(mcfly init bash)"' >> ~/.bashrc
    echo 'eval "$(mcfly init zsh)"' >> ~/.zshrc
fi

# procs
if command -v procs &> /dev/null
then
    echo "procs already installed"
else
    sudo snap install procs
fi

# cheat
if command -v cheat &> /dev/null
then
    echo "cheat already installed"
else
    go get -u github.com/cheat/cheat/cmd/cheat
fi

# broot
if command -v br &> /dev/null
then
    echo "br already installed"
else
    wget https://dystroy.org/broot/download/x86_64-linux/broot
    chmod +x broot
    sudo mv broot /usr/local/bin/br
fi

# delta
if command -v delta &> /dev/null
then
    echo "delta already installed"
else
    cargo install git-delta
fi

# dog
if grep -F "alias dog" ~/.zshrc &> /dev/null
then
    echo "dog already installed"
else
    echo 'alias dog="docker run -it --rm dog"' >> ~/.zshrc
    echo 'alias dog="docker run -it --rm dog"' >> ~/.bashrc
fi

# httpie
if command -v http &> /dev/null
then
    echo "http already installed"
else
    sudo apt install -y httpie
fi

# glances
if grep -F "alias glances" ~/.zshrc &> /dev/null
then
    echo "glances already installed"
else
    echo 'alias glances="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it nicolargo/glances:latest-full"' >> ~/.zshrc
    echo 'alias glances="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it nicolargo/glances:latest-full"' >> ~/.bashrc
fi

# bat

if command -v batcat &> /dev/null
then
    echo "batcat already installed"
else
    sudo apt install -y bat
fi

# lsd
if command -v lsd &> /dev/null
then
    echo "lsd already installed"
else
    cargo install lsd
fi

# choose
if command -v choose &> /dev/null
then
    echo "choose already installed"
else
    cargo install choose
fi

# fd-find
if command -v fdfind &> /dev/null
then
    echo "fdfind already installed"
else
    sudo apt install -y fd-find
fi

# fzf
if command -v fzf &> /dev/null
then
    echo "fzf already installed"
else
    sudo apt install -y fzf
fi

# gping
if command -v gping &> /dev/null
then
    echo "gping already installed"
else
    echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
    wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
    sudo apt update -y
    sudo apt install -y gping
fi

# curlie
if command -v curlie &> /dev/null
then
    echo "curlie already installed"
else
    LATEST=$(curl -s https://github.com/rs/curlie/releases/tag/v1.6.0 | grep -oP "/[a-zA-Z0-9.:_/]+linux_amd64.deb" | head -n 1 | sed "s#^#https://github.com&#g")
    wget "$LATEST"
    sudo apt install -y ./curlie*.deb
fi

# gtop
if grep -F "alias gtop" ~/.zshrc &> /dev/null
then
    echo "gtop already installed"
else
    echo 'alias gtop="docker run --rm -it --name gtop --net=host --pid=host aksakalli/gtop"' >> ~/.zshrc
    echo 'alias gtop="docker run --rm -it --name gtop --net=host --pid=host aksakalli/gtop"' >> ~/.bashrc
fi

# zoxide
if command -v zoxide &> /dev/null
then
    echo "zoxide already installed"
else
    curl -sS https://webinstall.dev/zoxide | bash
fi

# bottom
if command -v btm &> /dev/null
then
    echo "btm already installed"
else
    LATEST=$(curl -s https://github.com/ClementTsang/bottom/releases | grep -oP "/[a-zA-Z0-9.:_/]+_amd64.deb" | grep -viE "nightly" | head -n 1 | sed "s#^#https://github.com&#g")
    wget "$LATEST"
    sudo apt install -y ./bottom*.deb
fi

# hyperfine
if command -v hyperfine &> /dev/null
then
    echo "hyperfine already installed"
else
    cargo install hyperfine
fi

# du-dust
if command -v dust &> /dev/null
then
    echo "dust already installed"
else
    cargo install du-dust
fi

# sd
if command -v sd &> /dev/null
then
    echo "sd already installed"
else
    cargo install sd
fi

# ripgrep
if command -v rg &> /dev/null
then
    echo "rg already installed"
else
    sudo apt install -y -o Dpkg::Options::="--force-overwrite" ripgrep
fi

# tldr
if command -v tldr &> /dev/null
then
    echo "tldr already installed"
else
    sudo apt install -y tldr
fi

# duf
if command -v duf &> /dev/null
then
    echo "duf already installed"
else
    sudo snap install duf-utility
fi

# jq
if command -v jq &> /dev/null
then
    echo "jq already installed"
else
    sudo apt install -y jq
fi

# ag
if command -v ag &> /dev/null
then
    echo "ag already installed"
else
    sudo apt install silversearcher-ag
fi

GREEN='\033[0;32m'
NC='\033[0m'
printf "${GREEN}You're all set, restart your shell! :)${NC}"
