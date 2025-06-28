set -x

# sudo apt install zsh zsh-syntax-highlighting

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "Need user password for chsh"
chsh -s $(which zsh) $USER

## echo "Gonna install fonts. Takes a long time."
## cd ~/Downloads
## git clone https://github.com/ryanoasis/nerd-fonts
## cd nerd-fonts
## bash install.sh
## cd -

