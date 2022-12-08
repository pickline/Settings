SYSTEM=`uname -s`
echo $SYSTEM

# some dependencies
if [ 'Darwin' = $SYSTEM ]; then
    brew install bat
    brew install neovim --HEAD
    brew install dust
    brew install duf
    brew install ack
    brew install htop
    brew install procs
elif [ 'Linux' = $SYSTEM ]; then
    sudo apt install bat
    sudo apt install neovim
    sudo apt install htop

    sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"
    pacstall -I dust-bin
    pacstall -I duf-deb

    curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
    source "$HOME/.cargo/env"
    cargo install procs
fi

# install zimfw
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
# use custom config file
cp initrc ~/.initrc
cp zshrc ~/.zshrc
cp zimrc ~/.zimrc

# install fow zimfw
zimfw install

