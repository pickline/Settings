SYSTEM=`uname -s`
echo $SYSTEM

# some dependencies
if [ 'Darwin' = $SYSTEM ] then
    brew install bat
    brew install neovim --HEAD
elif [ 'Linux' = $SYSTEM ] then
    sudo apt install bat
    sudo apt install neovim
fi

# install zimfw
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
# use custom config file
cp initrc ~/.initrc
cp zshrc ~/.zshrc
cp zimrc ~/.zimrc

# install fow zimfw
zimfw install

