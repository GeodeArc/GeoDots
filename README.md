<h3 align="center">
  <img width="80%" src=https://github.com/user-attachments/assets/b3c9cd7c-dce9-44cb-9a21-434054c2f737/>
</h3>

<div align="center">
  <p>⚠️ This is an unfinished project! While it should be installable, you may run into issues.</p>
  <p>❤️ Many things arent finished, stay tuned for more!</p>
</div>

> [!NOTE]
> This will only work for Arch Linux Based distros (tested Arch, CachyOS, Endeavour). This MAY change in the future, no guarantees though.

> [!WARNING]
> For current users, please update the swaync config file. Ive fixed all the glaring issues, please let me know if you find any more.

#

### 🌟 INSTALLATION:

<details> 
  <summary>⌛ Automatic (RECOMMENDED)</summary>

  <p></p>
  
  > Should work on pretty much any arch based system (minimal, or not). If theres an issue installing, please submit a bug report! 

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
    
  - 🗃️ Head over the the gh-pages branch, and install the dependencies in the text files labeled 'pkg'

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

![Main Setup with SwayNC](https://github.com/user-attachments/assets/20b1735a-2608-432e-b642-b56b6f227d4c)

![CLI apps showcase & Power menu](https://github.com/user-attachments/assets/6c7cf91e-f1fe-43a3-8cb1-aebb41d66e69)

![Screenshot stuff & Resources](https://github.com/user-attachments/assets/9a5ad75b-a334-4bf1-8a8a-230b44348b93)

![Minimal Config](https://github.com/user-attachments/assets/9824632d-5602-44cf-91c9-1d969563f47b)

![Lock Screen (Hyprlock)](https://github.com/user-attachments/assets/10b95804-ec20-4dac-b7e1-399e869e5ea1)

# 

### ⚙ MORE:

<details> 
  <summary>🟡 Roadmap</summary>
  <h3>Current (Roadmap for first RELEASE):</h3>
    
  - Finish settings script

  - Finish required wiki articles

  <h3>Maybe later:</h3>

  - Add hyprlock autologon (maybe with sddm since that seems easy)

  - Add matugen GTK theming atleast, maybe deprecate pywal?

  - Add quicker installation (auto install)

  - Ability to choose nerd font (might not add)

  - Add hyprlock click widgets when available?

  - Installer for other distros (sobbing emoji)

  - NVIDIA selection (i folded)

</details> 

# 

### 💞 Special thanks/credits:

Most of these have been modified heavily, but these have still been really helpful!

- [ML4W](https://ml4w.com), for the original waybar design
- [adi1090x](https://github.com/adi1090x/rofi), for the original rofi designs
- [zDyanTB](https://github.com/zDyanTB/HyprNova), for the original swaync design 
- [Keyitdev](https://github.com/Keyitdev/sddm-astronaut-theme) and [birbkeks](https://github.com/birbkeks/win11-sddm-theme), for the SDDM themes.
