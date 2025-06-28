set -x

while getopts ":ds" opt; do
  case ${opt} in
    d ) docker=true
      ;;
    s ) evensudo=true
      ;;
    \? ) echo "Usage: cmd [-d] [-s]"
      ;;
  esac
done

if [ "$docker" = true ]
then
  myapt="apt"
else
  myapt="sudo apt "
fi

echo "install ubuntu with docker: $docker ; evensudo: $evensudo ; myapt: $myapt"

if [ "$EUID" -eq 0 ] && [ "$evensudo" != true ]; then
  echo "Please don't run as root, some of this does user setup too"
  exit
fi

$myapt update

$myapt install git curl ncdu tmux wget zsh \
  build-essential apt-transport-https neovim -y

if [ "$docker" != true ]; then
  $myapt install chromium-browser speedcrunch apt-transport-https -y
fi


# nodejs
if [ "$docker" = true ]; then
  curl -sL https://deb.nodesource.com/setup_14.x | bash -
else
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
fi

$myapt install -y nodejs

# git
git config --global credential.helper cache
# git config --global credential.helper store
git config --global user.email "jesusiniesta@fastmail.com"
git config --global user.name "Jesús Iniesta"


# nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
