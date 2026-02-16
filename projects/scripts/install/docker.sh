#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/projects/scripts

source "$SCRIPTS_DIR/lib/common.sh"

PACKAGES=(
  docker
  docker-compose
  docker-buildx
)

for pkg in "${PACKAGES[@]}"; do
  log_info "\nInstalling $pkg\n"
  yay -S --needed --noconfirm "$pkg" ||
    printf "\n${RED}Failed to install $pkg. Continuing without!${NC}\n"
done

log_info "\nLimit log size to avoid running out of disk/n"
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

log_info "\nStart Docker automatically\n"
sudo systemctl enable docker

log_info "\nGive this user privileged Docker access\n"
sudo usermod -aG docker ${USER}

log_info "\nPreventing Docker from preventing boot for network-online.target\n"
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/no-block-boot.conf <<'EOF'
[Unit]
DefaultDependencies=no
EOF

log_info "\nRestating systemctl\n"
sudo systemctl daemon-reload
