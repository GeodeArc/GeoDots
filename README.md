<h3 align="center">
  <img width="80%" src=https://github.com/user-attachments/assets/b3c9cd7c-dce9-44cb-9a21-434054c2f737/>
</h3>

<div align="center">
  <p>⚠️ This is an unfinished project! While it should be installable, you may run into issues.</p>
  <p>❤️ Many things arent finished, stay tuned for more!</p>
</div>

> [!NOTE]
> This will only work for Arch Linux Based distros (tested Arch, CachyOS, Endeavour). This MAY change in the future, no guarantees though.

#

### 🌟 INSTALLATION:

<details> 
  <summary>⌛ Automatic (RECOMMENDED)</summary>

  <p></p>
  
  > Should work on pretty much any arch based system (minimal, or not). If thers an issue installing, please submit a bug report! 

  ```
  bash <(curl -fsSL "https://geodearc.github.io/GeoDots/install.sh")
  ```
  <p></p>

  > If the above command doesnt work, you are likely using a non-standard shell (like fish). Try running this command instead (assumes bash is installed, install `bash` with pacman otherwise).

  ```
  bash -c "$(curl -fsSL https://geodearc.github.io/GeoDots/install.sh)"
  ```

</details> 
<details> 
  <summary>⌨ Manual(ish)</summary>

  <p></p>

  - 🗃️ Ensure dependencies & update
  ```
  sudo pacman -Syu
  sudo pacman -S --needed git base-devel
  ```
  - 💾 Begin Installation!
  > Needs to be in home folder for now! May make the script better/adaptive if i feel like it
  ```
  cd
  git clone https://github.com/GeodeArc/GeoDots/
  cd GeoDots
  ./install.sh
  ```
</details> 

<details> 
  <summary>🐧 Actually Manual</summary>

  <p></p>
    
  - 🗃️ Head over the the gh-pages branch, and install the dependencies in the text files labled 'pkg'

  - 🔶 Go to each config folder in /.config/, and put a config (e.g light alt waybar, GTK hyprland.conf), and move it to the root of that config folder

  - 💾 Copy folders from /.config/ to your .config folder

  - 🏠 Copy the /Dots folder to your home directory

</details> 

#

### 💫 FEATURES

- ⚙️ Stupidly simple installer with bug prevention 
- 💥 3 different modes (Light, Dark, Minimal)
- 🖌️ Consistent styling (ish)
- 🌈 Color scheme changes with wallpaper
- 🏃 Very easy to configure and get started!

# 

### 🖼️ SCREENSHOTS:

![dots1](https://github.com/user-attachments/assets/b26a1b4a-86f7-4606-8451-5d5e7f1fc9fb)

![dots2](https://github.com/user-attachments/assets/6698c4b8-ddb0-45a1-9bb6-ce364fce1321)

![dots3](https://github.com/user-attachments/assets/e6ba7d35-bee7-47c4-ac88-47dac3e0ee1e)

![dots4](https://github.com/user-attachments/assets/6572e620-b8bd-4f87-b52b-e3c5dbda27b5)

![dots5](https://github.com/user-attachments/assets/6caa0ed8-fd97-49a3-8b8e-17aba315451d)

# 

### ⚙ MORE:

<details> 
  <summary>🟡 Roadmap</summary>
  <h3>Current:</h3>

  - Fix colours for rofi/hyprland
    
  - Add auto install
    
  - Finish settings script
    
  - Add hyprlock autologon (maybe with sddm since that seems easy)

  <h3>Maybe later:</h3>

  - Ability to choose nerd font (might not add)

  - Add hyprlock click widgets when available?

  - Installer for other distros

  - NVIDIA selection (i folded)

</details> 

# 

### 💞 Special thanks/credits:
- ML4W, for the original waybar design (https://ml4w.com)
- adi1090x, for the original rofi designs (https://github.com/adi1090x/rofi)
- zDyanTB, for the original swaync design (https://github.com/zDyanTB/HyprNova)
- birbkeks, for the SDDM theme (more theme options probably coming soon).