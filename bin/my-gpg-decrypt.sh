gpg --decrypt "$1" > $(basename -s .gpg "$1")
