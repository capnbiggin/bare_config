#!/usr/bin/env bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[96m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
  echo -e "\n${BLUE}[INFO]${NC} $1"
}

log_success() {
  echo -e "\n${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
  echo -e "\n${YELLOW}[WARNING]${NC} $1"
}

log_error() {
  echo -e "\n${RED}[ERROR]${NC} $1"
}

# Exit immediately if a command exits with a non-zero status
set -e

catch_errors() {
  log_error "\nCapndot installation failed!\n"
}

trap catch_errors ERR
