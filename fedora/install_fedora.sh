#!/bin/bash

# Fedora KDE Post-Install Script for Chuwi MiniBook X
# Includes touchscreen support, dev tools, browsers, LibreOffice, and more

set -euo pipefail
set -x  # Log all commands as they're executed

# --------------------------
# 0. System Update & Repos
# --------------------------
sudo dnf update -y
sudo dnf install -y \
  dnf-plugins-core \
  rpmfusion-free-release \
  rpmfusion-nonfree-release

# --------------------------
# 1. Touchscreen & Tablet Support
# --------------------------
sudo dnf install -y iio-sensor-proxy qt5-qtvirtualkeyboard
systemctl --user enable --now iio-sensor-proxy.service

# --------------------------
# 2. Browsers
# --------------------------

# Firefox (preinstalled, but just in case)
sudo dnf install -y firefox

# Brave Browser
sudo dnf config-manager --add-repo https://brave.com/brave-browser.repo
sudo dnf install -y brave-browser

# --------------------------
# 3. Dev Tools
# --------------------------
bash ~/dotfiles/install_fedora_base.sh

# --------------------------
# 4. NVM + Node.js (LTS)
# --------------------------
export NVM_DIR="$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Ensure NVM is available in this script session
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# Add NVM to future shell sessions
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc

# Install Node LTS
nvm install --lts
nvm use --default

# --------------------------
# 5. VS Code
# --------------------------
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf install -y code

# --------------------------
# 6. Syncthing
# --------------------------
sudo dnf install -y syncthing
systemctl --user enable --now syncthing.service

# --------------------------
# 7. Tailscale
# --------------------------
curl -fsSL https://pkgs.tailscale.com/stable/fedora/tailscale.repo | sudo tee /etc/yum.repos.d/tailscale.repo
sudo dnf install -y tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up

# --------------------------
# 8. LibreOffice
# --------------------------
sudo dnf install -y libreoffice libreoffice-langpack-en

# --------------------------
# 9. Flatpak + Flathub (Optional GUI apps)
# --------------------------
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# --------------------------
# Done
# --------------------------
echo -e "\n✅ All done! Reboot recommended for rotation/scaling and keyboard settings to apply fully."
