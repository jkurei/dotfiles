if [ "$EUID" -eq 0 ]
  then echo "Please don't run as root, some of this does user setup too"
  exit
fi

sudo apt install git curl

# node
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# all!
sudo apt-get install apt-transport-https # something vscode wants
sudo apt update
sudo apt-get install -y nodejs build-essential \
  mongodb-org \
  tmux wget \
  curl git zsh ncdu \
  python-dev python-pip python3-dev python3-pip

# nvim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# git
git config --global credential.helper cache
git config --global user.email "jesusiniesta@fastmail.com"
git config --global user.name "Jesús"
