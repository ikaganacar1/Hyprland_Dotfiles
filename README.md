# ikaganacar's Hyprland Dotfiles

<details>
<summary><h2>🖼️ Screenshots<h2/></summary>

![image](https://github.com/user-attachments/assets/d6706f5d-4eb8-44ee-ad76-f125866ef1e4)<br>
![image](https://github.com/user-attachments/assets/8b5d6c40-e943-4805-923e-11451710a5e4)<br>
![image](https://github.com/user-attachments/assets/2480e981-7223-4736-a137-38436249cd85)<br>


</details>

## I am using:
* Arch Linux with [Hyprland](https://hyprland.org/).
* [Waybar](https://github.com/Alexays/Waybar) with [Wayves.](https://github.com/jvc84/wayves) (cava integration to waybar)
* [Swww](https://github.com/LGFae/swww) for [.gif backgrounds](https://motionbgs.com/). 
* Sddm with [Keyitdev/sddm-astronaut-theme](https://github.com/ikaganacar1/Hyprland_Dotfiles/tree/main/sddm).
* Custom Main/New page for browser.
* [Wofi](https://github.com/SimplyCEO/wofi) for browse apps and wallpapers.
* [Pywal](https://github.com/dylanaraps/pywal) for changing colors.
* [Kitty](https://sw.kovidgoyal.net/kitty/) terminal with [Starship](https://github.com/starship/starship).
* [Neovim](https://neovim.io/) with lazy and pywal colors.

## Installation  
### Dotfiles:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ikaganacar1/Hyprland_Dotfiles/refs/heads/main/scripts/install.sh)
```
You just need to copy this to your terminal. Note that this installation script is only work with arch's pacman. <br>

### Custom New/Home page for Firefox:
The installation is explained [here.](https://github.com/ikaganacar1/Hyprland_Dotfiles/tree/main/fuckin_firefox_policy)

### For the debugging:
Good Luck :)

## Notes
* I couldn't give my gif wallpapers with this repo because of the size issues. You can download mp4 wallpapers from [here](https://motionbgs.com/) and run the `mp4togif.bash` for automated installation.<br>
```bash
source scripts/mp4togif.bash /path/to/mp4/wallpaper [name] [framerate default=15]
```
If you already have a .gif file put it inside of the backgrounds/ folder and put a frame in background/gifs folder.
* Feel free to contribute :)
