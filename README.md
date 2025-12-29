<h3 align="center">
  <img width="100%" height="auto" alt="GeoDots Banner (cringe)" src="https://github.com/user-attachments/assets/c9e819ac-40ab-4e95-875d-b492a6f20fd8" />
  <h3 align="center">by <b>GeodeArc <3</b></h3>
</h3>

<div align="center">
  <i>version 0.1.2</i>
  <p>❤️ Many things arent finished, stay tuned for more!</p>
</div>

> [!NOTE]
> GeoDots is only (currently) supported for Arch Linux Based distros (tested Arch, CachyOS, Endeavour). This MAY change later on, no guarantees.

> [!WARNING]
> Hyprland 53 introduced new syntax, meaning your config will be invalid when you update. Please use the upgrade script if you are affected.

#

### 🌟 INSTALLATION:

> Should work on pretty much any arch based system (minimal, or not). If theres an issue installing, please submit a bug report! 

```
bash <(curl -s https://gdrc.me/dots.sh)
```

> If the above command doesnt work, you are likely using a non-standard shell (like fish). Try running this command instead (assumes bash is installed, install `bash` with pacman otherwise).

```
bash -c "$(curl -s https://gdrc.me/dots.sh)"
```

<details> 
  <summary>⌨ Manual Mode (ish)</summary>

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

  - Clone the repo. I hope you know how to do this already.
  - Head over the the gh-pages branch, and install the dependencies in the text files labeled 'pkg'. Not everything is 'technically' required.
  - Go to each config folder in /.config/, and if required, move a config (e.g modern+light) to the root of that folder.
  - Copy folders from /.config/ to your .config folder
  - Copy the /Dots folder to your home directory
  - Adjust the /Dots/Options files accordingly to your preferences. I will add more documentation here later (maybe).

</details> 

#

### 💫 FEATURES

- ⚙️ Incredibly easy installer with bug prevention 
- 💥 3 different styles with light/dark themes
- 🖌️ Consistent styling everywhere (ish)
- 🌈 Color scheme changes with wallpaper
- 🏃 Very easy to configure and get started!

# 

### 🖼️ SCREENSHOTS:

#### Modern Theme
| Dark | Light |
|:---|:---------------|
| ![dark - modern](https://github.com/user-attachments/assets/a5558edf-8e42-4480-9007-973275fd95c4) | ![light - modern](https://github.com/user-attachments/assets/0890c9a8-acec-4b25-b6b0-7e4e95a5c8ff) |
| Terminal Stuff | Hyprlock |
| ![terminal stuff](https://github.com/user-attachments/assets/4c4cec04-b809-428d-9321-11febc144417) | ![hyprlock](https://github.com/user-attachments/assets/282bb4b1-7d4f-4cf3-9811-e0e636bd6226) |

#### Colorful Theme
| Dark | Light |
|:---|:---------------|
| ![dark - colorful](https://github.com/user-attachments/assets/6d8af081-8fe1-49bb-89c9-62195b0b4cee) | ![light-colorful](https://github.com/user-attachments/assets/7d13fc2a-a9c3-4b4a-887b-ffe585659db3) |
| Terminal Stuff | Hyprlock |
| ![terminal showcase](https://github.com/user-attachments/assets/b4932326-8a5a-465f-bc24-4d6824f89d62) | ![hyprlock](https://github.com/user-attachments/assets/2090c45f-b6a5-4aaa-a616-1d48ab63fdcd) |

#### Minimal Theme
| Dark | Light |
|:---|:---------------|
| ![dots 4](https://github.com/user-attachments/assets/a2ca5bc2-0b44-41dd-96b5-494cea577112) | ![dots 3](https://github.com/user-attachments/assets/934076e1-d6ab-4f4c-a61e-406fa6d74da2) |
| Terminal Stuff | Hyprlock |
| ![dots 2](https://github.com/user-attachments/assets/c9df1943-9e1a-40c2-b30c-2e46ac4201a1) | ![dots 1](https://github.com/user-attachments/assets/8710cbce-110f-4a22-aa72-374750bc4363) |

# 

### ⚙ MORE:

<details> 
  <summary>Roadmap</summary>

  - Add nvim config/editor choice?

  - Make settings script more robust/easier to use

  - Add hyprlock autologon (greetd probably)

  - Make some configs (waybar, swaync etc) less messy

  - Add matugen GTK theming, pywal can stay for now

  - Add pywalfox if firefox is selected

  - Add quicker installation (auto install)

  - Ability to choose nerd font, terminal, etc (might not add)

  - Switch from plaintext files to envvars?

  - Installer for other distros (sobbing emoji)

</details> 

# 

### 💞 Special thanks/credits:

Most of these have been modified heavily, but these have still been really helpful!

- [ML4W](https://ml4w.com), for the original waybar design
- [adi1090x](https://github.com/adi1090x/rofi), for the original rofi designs
- [zDyanTB](https://github.com/zDyanTB/HyprNova), for the original swaync design 
- [Keyitdev](https://github.com/Keyitdev/sddm-astronaut-theme) and [birbkeks](https://github.com/birbkeks/win11-sddm-theme), for the SDDM themes.
