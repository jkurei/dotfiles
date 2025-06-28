grep -v "^\#" "$1" |while read -r i; do code --install-extension "$i"; done
