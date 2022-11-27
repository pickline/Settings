SYSTEM=`uname -a`

if [ -d '~/.config/nvim' ] then
    rm -rf ~/.config.nvim
fi

if [ -d '~/.vim' ] then
    rm -rf ~/.vim 
fi

if [ 'Darwin' = $SYSTEM ] then
    brew install neovim --HEAD
    brew install lazygit
elif [ 'Linux' = $SYSTEM ] then
    # neovim
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt update
    sudo apt install neovim

    # lazygit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
fi

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# add custom configs
cp ./nvim ~/.vim
ln -s ~/.vim ~/.config/nvim
