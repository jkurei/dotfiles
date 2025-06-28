#!/bin/bash
set -euo pipefail
set -x

# Basic CLI tools
sudo dnf update -y
sudo dnf install -y --skip-unavailable \
  git curl wget unzip \
  zsh neovim tmux htop btop eza bat
