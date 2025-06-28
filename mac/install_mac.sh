/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


brew install neovim tmux git wget syncthing rsync
brew install reattach-to-user-namespace
# nvm

# brew install --cask calibre

brew install --cask \
	firefox \
	brave-browser \
	visual-studio-code \
	spotify \
	dbeaver-community \
	obsidian \
	nextcloud \
	keepassxc \
	iina \
	vlc \
	the-unarchiver \
	jdownloader \
	grandperspective \
	contexts \
	raycast \
	libreoffice \
	mark-text \
	onyx \
	qbittorrent \
	shottr \
	karabiner-elements \
	qsyncthingtray

# nvm install --lts

# newer, questionable stuff
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install font-monaspace
brew install font-iosevka

brew tap FelixKratz/formulae
brew install sketchybar
brew install borders

# run borders with
# borders active_color=0x8800cbdd inactive_color=0x00000000 width=6.0 &

# uninstall these with
# brew uninstall sketchybar borders
# brew untap FelixKratz/formulae

mkdir -p ~/.config/karabiner/assets/complex_modifications
cd ~/.config/karabiner/assets/complex_modifications
ln -s ~/dotfiles/personal_karabiner.json
