#!/usr/bin/env bash
set -e

echo "🚀 Neovim IDE Setup Script"
echo "========================="

OS="$(uname -s)"

install_arch() {
  echo "📦 Arch / Manjaro detected"
  sudo pacman -Syu --noconfirm \
    neovim git nodejs npm ripgrep fd lazygit docker docker-compose tmux
}

install_ubuntu() {
  echo "📦 Ubuntu / Debian detected"
  sudo apt update
  sudo apt install -y \
    neovim git nodejs npm ripgrep fd-find lazygit docker.io docker-compose tmux
}

install_fedora() {
  echo "📦 Fedora detected"
  sudo dnf install -y \
    neovim git nodejs npm ripgrep fd-find lazygit docker docker-compose tmux
}

install_opensuse() {
  echo "📦 openSUSE detected"
  sudo zypper install -y \
    neovim git nodejs npm ripgrep fd lazygit docker docker-compose tmux
}

install_alpine() {
  echo "📦 Alpine Linux detected"
  sudo apk add \
    neovim git nodejs npm ripgrep fd lazygit docker docker-compose tmux
}

install_macos() {
  echo "🍎 macOS detected"

  if ! command -v brew &>/dev/null; then
    echo "❌ Homebrew not found"
    echo "👉 Install: https://brew.sh"
    exit 1
  fi

  brew install \
    neovim git node ripgrep fd lazygit docker tmux
}

install_windows() {
  echo "🪟 Windows detected"

  if command -v wsl.exe &>/dev/null; then
    echo "⚠️ Please run this script INSIDE WSL (Ubuntu recommended)"
    echo "👉 https://learn.microsoft.com/windows/wsl"
    exit 1
  fi

  if command -v winget &>/dev/null; then
    echo "📦 Installing via winget..."
    winget install Neovim.Neovim
    winget install Git.Git
    winget install OpenJS.NodeJS
    winget install BurntSushi.ripgrep
    winget install sharkdp.fd
    winget install junegunn.lazygit
    winget install tmux.tmux
  else
    echo "❌ winget not found"
    exit 1
  fi
}

# ---- OS SWITCH ----
case "$OS" in
  Linux)
    if [ -f /etc/arch-release ]; then
      install_arch
    elif [ -f /etc/debian_version ]; then
      install_ubuntu
    elif [ -f /etc/fedora-release ]; then
      install_fedora
    elif [ -f /etc/SuSE-release ]; then
      install_opensuse
    elif [ -f /etc/alpine-release ]; then
      install_alpine
    else
      echo "❌ Unsupported Linux distro"
      exit 1
    fi
    ;;
  Darwin)
    install_macos
    ;;
  MINGW*|MSYS*|CYGWIN*)
    install_windows
    ;;
  *)
    echo "❌ Unsupported OS: $OS"
    exit 1
    ;;
esac

# ---- live-server ----
if command -v npm &>/dev/null && ! command -v live-server &>/dev/null; then
  echo "🌐 Installing live-server..."
  npm install -g live-server
fi

# ---- Backup ----
echo "🛟 Backing up existing Neovim config..."
[ -d "$HOME/.config/nvim" ] && mv ~/.config/nvim ~/.config/nvim.bak.$(date +%s)
[ -d "$HOME/.local/share/nvim" ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak.$(date +%s)

# ---- Clone config ----
echo "📥 Cloning Neovim configuration..."
git clone https://github.com/tuongwall/neovim-setup.git ~/.config/nvim

echo ""
echo "✅ Installation complete!"
echo "➡️ Run: nvim"
echo "➡️ Run: :checkhealth"
echo "➡️ Restart Neovim once if needed"
