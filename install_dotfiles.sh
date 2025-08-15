
# git clone https://gitlab.com/jkurei/dotfiles
# ssh-keygen -t rsa -C "your.email@example.com" -b 4096
# cat /home/jim/.ssh/id_rsa.pub
# git clone https://gitlab.com/jkurei/dotfiles

[ -e ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_original
[ -e ~/.zshrc ] && rm ~/.zshrc

ln -s ~/dotfiles/shell/bashrc ~/.bashrc
ln -s ~/dotfiles/shell/zshrc ~/.zshrc
ln -s ~/dotfiles/shell/zshrc_aliases ~/.zshrc_aliases
ln -s ~/dotfiles/shell/zshrc_encryption ~/.zshrc_encryption
ln -s ~/dotfiles/shell/zshrc_spaceship ~/.zshrc_spaceship

mkdir -p ~/.tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux_themes/ ~/.tmux/themes

mkdir -p ~/.config/nvim
cd ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim
ln -s ~/dotfiles/nvim/installer.sh
bash ./installer.sh ~/.cache/dein
## cd -


