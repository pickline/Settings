SYSTEM=`uname -a`

if [ -d '~/.config/nvim' ] then
    rm -rf ~/.config/nvim
fi
if [ -d '~/.vim' ] then
    rm -rf ~/.vim 
fi

# some dependencies
if [ 'Darwin' = $SYSTEM ]; then
    brew install neovim --HEAD
    brew install lazygit
    brew install bat
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

    # neovim
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt update
    sudo apt install neovim

    # lazygit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
fi

# install zimfw
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
# use custom config file
cp zsh/initrc ~/.initrc
cp zsh/zshrc ~/.zshrc
cp zsh/zimrc ~/.zimrc
# install for zimfw
zimfw install

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# add custom configs
cp ./nvim ~/.vim
ln -s ~/.vim ~/.config/nvim
