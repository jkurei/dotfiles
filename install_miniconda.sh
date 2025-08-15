#!/bin/bash
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
~/miniconda3/bin/conda init
source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null
rm -f Miniconda3-latest-Linux-x86_64.sh

