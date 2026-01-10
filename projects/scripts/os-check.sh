#!/usr/bin/env bash

detect_os() {
  local kernel=$(uname -s)
  case "${kernel}" in
  Linux*) detect_linux_type ;;
  Darwin*) echo "macOS" ;;
  CYGWIN*) echo "Windows (Cygwin)" ;;
  MINGW*) echo "Windows (Git Bash/MinGW)" ;;
  MSYS*) echo "Windows (MSYS)" ;;
  *BSD*) echo "BSD" ;;
  SunOS*) echo "Solaris" ;;
  AIX*) echo "AIX" ;;
  *) echo "Unknown OS: ${kernel}" ;;
  esac
}

detect_linux_type() {
  # Detect if running under WSL
  if grep -qi microsoft /proc/version 2>/dev/null || grep -qi wsl /proc/version 2>/dev/null; then
    detect_linux_distro "WSL"
    return
  fi

  # Fallback: some WSL2 systems might not have "Microsoft" but have WSL in kernel name
  if uname -r | grep -qi microsoft 2>/dev/null || uname -r | grep -qi wsl 2>/dev/null; then
    detect_linux_distro "WSL"
    return
  fi

  # Native Linux
  detect_linux_distro "Native Linux"
}

detect_linux_distro() {
  local environment="$1" # "Native Linux" or "WSL"

  local distro_info="Unknown distribution"

  # Most modern distros use /etc/os-release
  if [[ -f /etc/os-release ]]; then
    # shellcheck source=/dev/null
    . /etc/os-release
    distro_info="${PRETTY_NAME:-${NAME} ${VERSION_ID:-}}"
  # Older Ubuntu/Debian
  elif [[ -f /etc/lsb-release ]]; then
    # shellcheck source=/dev/null
    . /etc/lsb-release
    distro_info="${DISTRIB_DESCRIPTION:-${DISTRIB_ID} ${DISTRIB_RELEASE}}"
  # Red Hat family
  elif [[ -f /etc/redhat-release ]]; then
    distro_info="$(cat /etc/redhat-release)"
  # SUSE
  elif [[ -f /etc/SuSE-release ]]; then
    distro_info="$(head -n1 /etc/SuSE-release)"
  # Arch
  elif [[ -f /etc/arch-release ]]; then
    distro_info="Arch Linux"
  # Alpine
  elif [[ -f /etc/alpine-release ]]; then
    distro_info="Alpine $(cat /etc/alpine-release)"
  # Debian fallback
  elif [[ -f /etc/debian_version ]]; then
    distro_info="Debian $(cat /etc/debian_version)"
  fi

  echo "Linux ($environment: $distro_info)"
}

echo "Detected OS: $(detect_os)"
