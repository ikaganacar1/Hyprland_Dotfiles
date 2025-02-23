#!/bin/bash

read -p "Do you want to be asked for confirmation before each step? [Y/n]: " user_choice
case "$user_choice" in
[nN]) NO_CONFIRM=true ;;
*) NO_CONFIRM=false ;;
esac

confirm() {
  if $NO_CONFIRM; then
    return 0
  fi

  read -p "$1 [Y/n]: " response
  case "$response" in
  [yY] | "") return 0 ;;
  *) return 1 ;;
  esac
}

if confirm "Clone this repository? (You Should)"; then
  git clone https://github.com/ikaganacar1/Hyprland_Dotfiles.git
  cd Hyprland_Dotfiles
fi

INSTALLATION_DIR="$HOME/.config"

# INSTALLATION
if confirm "Install required packages?"; then
  sudo pacman -S --noconfirm git base-devel python-flask kitty swww fastfetch neovim wofi waybar dolphin swaync python-pywal spotify-launcher
  sudo pacman -S --noconfirm hyprland hypridle hyprlock hyprshot hyprutils
  sudo pacman -S --noconfirm ttf-cascadia-code-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common
fi

# SETUP
if confirm "Copy configuration files  to .config?"; then
  sudo cp -r fuckin_firefox_policy/ "$INSTALLATION_DIR"
  sudo cp -r hypr/ "$INSTALLATION_DIR"
  sudo cp -r kitty/ "$INSTALLATION_DIR"
  sudo cp -r nvim/ "$INSTALLATION_DIR"
  sudo cp -r waybar/ "$INSTALLATION_DIR"
  sudo cp -r wofi/ "$INSTALLATION_DIR"
  sudo cp -r fastfetch/ "$INSTALLATION_DIR"
  sudo cp -r wallpaper/ "$INSTALLATION_DIR"

  sudo cp ~/.config/starship.toml "$INSTALLATION_DIR"
  sudo cp ~/.bashrc "$INSTALLATION_DIR"
fi

cd "$INSTALLATION_DIR"

if confirm "Clone wayves repository for waybar?"; then
  git clone https://github.com/jvc84/wayves.git
  cd wayves
  mkdir -p ~/.config/cava
  cp assets/cava/cava_option_config ~/.config/cava
fi

if confirm "Install SDDM Theme?"; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
fi

echo "All done! I hope everything works :D"
cd "$HOME"
