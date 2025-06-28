echo "Gonna encrypt $1"

tar -cvzf "$1.tgz" "$1"
gpg -c "$1.tgz"

echo ""
echo "Remember to delete raws!"
echo "rm -rf "'"'"$1"'"'" "'"'"$1.tgz"'"'""
echo ""
