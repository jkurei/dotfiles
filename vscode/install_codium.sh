grep -v "^\#" extensions.txt|while read -r i; do codium --install-extension "$i"; done
