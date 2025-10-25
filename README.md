<h3 align="center">
  <img width="2561" height="1084" alt="GeoDots Banner (cringe)" src="https://github.com/user-attachments/assets/c9e819ac-40ab-4e95-875d-b492a6f20fd8" />
  <h3 align="center">by <b>GeodeArc <3</b></h3>
</h3>

<div align="center">
  <i>version 0.0.9 or something idk</i>
  <p>❤️ Many things arent finished, stay tuned for more!</p>
</div>

> [!NOTE]
> GeoDots is created for Arch Linux Based distros (tested Arch, CachyOS, Endeavour). This MAY change later on, no guarantees.

#

### 🌟 INSTALLATION:

<details> 
  <summary>⌛ Automatic (RECOMMENDED)</summary>

  <p></p>
  
  > Should work on pretty much any arch based system (minimal, or not). If theres an issue installing, please submit a bug report! 

  ```
  bash <(curl -fsSL "https://gdrc.me/dots.sh")
  ```
  <p></p>

  > If the above command doesnt work, you are likely using a non-standard shell (like fish). Try running this command instead (assumes bash is installed, install `bash` with pacman otherwise).

  ```
  bash -c "$(curl -fsSL https://gdrc.me/dots.sh)"
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

- ⚙️ Incredibly easy installer with bug prevention 
- 💥 3 different modes (Light, Dark, Minimal)
- 🖌️ Consistent styling (ish)
- 🌈 Color scheme changes with wallpaper
- 🏃 Very easy to configure and get started!

# 

### 🖼️ SCREENSHOTS:

![light + modern showcase](https://github.com/user-attachments/assets/635816b8-79f0-441e-8463-f6ade9aa5827)

![colorful showcase](https://github.com/user-attachments/assets/6d8af081-8fe1-49bb-89c9-62195b0b4cee)

![terminal stuff showcase](https://github.com/user-attachments/assets/9e89de01-28b6-4a0f-9092-e76107d44ec4)

![minimal showcase](https://github.com/user-attachments/assets/7e8ed97d-9600-43a0-9f71-c2f575e90e4b)

# 

### ⚙ MORE:

<details> 
  <summary>🟡 Roadmap</summary>
  <h3>Current (Roadmap for first RELEASE):</h3>
    
  - Add nvim config/editor choice?

  - Switch from plaintext files to envvars?

  - Make settings script more robust/easier to use

  - Better hyprlock with clickable widgets + more hyprlock themes?

  <h3>Maybe later:</h3>

  - Add hyprlock autologon (greetd probably)

  - Make some configs (waybar, rofi) less messy

  - Add matugen GTK theming atleast, maybe deprecate pywal?

  - Add pywalfox if firefox is selected

  - Add quicker installation (auto install)

  - Ability to choose nerd font, terminal, etc (might not add)

  - Installer for other distros (sobbing emoji)

</details> 

# 

### 💞 Special thanks/credits:

Most of these have been modified heavily, but these have still been really helpful!

- [ML4W](https://ml4w.com), for the original waybar design
- [adi1090x](https://github.com/adi1090x/rofi), for the original rofi designs
- [zDyanTB](https://github.com/zDyanTB/HyprNova), for the original swaync design 
- [Keyitdev](https://github.com/Keyitdev/sddm-astronaut-theme) and [birbkeks](https://github.com/birbkeks/win11-sddm-theme), for the SDDM themes.
