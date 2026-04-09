<h3 align="center">
  <img width="100%" height="auto" alt="GeoDots Logo" src="https://github.com/user-attachments/assets/2ac9a0ee-1d82-48bc-a166-4348eb762039" />
  <h3 align="center">by <b>GeodeArc <3</b></h3>
</h3>

<div align="center">
  <i>version 0.1.3a</i>
  <p>❤️ Many things arent finished, stay tuned for more!</p>
</div>

> [!NOTE]
> GeoDots is only (currently) supported for Arch Linux Based distros (tested Arch, CachyOS, Endeavour). This MAY change later on, no guarantees.

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
  <summary>🤔 Dont like curl bash?</summary>

  <p></p>

  Thats fair, heres a more rigid method. 
  
  Ensure dependencies & update
  ```
  sudo pacman -Syu
  sudo pacman -S --needed git base-devel
  ```
  Begin Installation
  ```
  git clone https://github.com/GeodeArc/GeoDots/ $HOME/GeoDots
  cd $HOME/GeoDots/
  ./install.sh
  ```

  > Feel free to inspect install.sh, and any other scripts inside of /Installation/.

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
| ![dark - modern](https://github.com/user-attachments/assets/c0e48ffb-3b0b-4271-b032-3f6d4120ca32) | ![light - modern](https://github.com/user-attachments/assets/4e19cf8e-41ce-431d-84fa-ba7e20c860fd) |
| Terminal Stuff | Hyprlock |
| ![terminal stuff](https://github.com/user-attachments/assets/9ecf5328-1ff9-45a8-acb8-ebb16884d563) | ![hyprlock](https://github.com/user-attachments/assets/c8c12fb3-0cac-449b-b055-9f09373cb807) |

#### Colorful Theme
| Dark | Light |
|:---|:---------------|
| ![dark - colorful](https://github.com/user-attachments/assets/653f1aa1-c541-480a-9611-50a25545d3ad) | ![light-colorful](https://github.com/user-attachments/assets/7d13fc2a-a9c3-4b4a-887b-ffe585659db3) |
| Terminal Stuff | Hyprlock |
| ![terminal showcase](https://github.com/user-attachments/assets/936b526f-03f9-4bc8-97fd-547e6d88ff2c) | ![hyprlock](https://github.com/user-attachments/assets/16269b72-ba33-403f-953e-21dc95386a8a) |

#### Minimal Theme
| Dark | Light |
|:---|:---------------|
| ![dark - minimal](https://github.com/user-attachments/assets/cdbd6319-00c7-4ab2-a8ee-bf3c77991107) | ![light - minimal](https://github.com/user-attachments/assets/1aeb055f-2005-4dbf-a5b2-d1843f64e418) |
| Terminal Stuff | Hyprlock |
| ![terminal showcase](https://github.com/user-attachments/assets/3300803c-2ee2-4a2b-8b52-c1ab75d90dac) | ![hyprlock](https://github.com/user-attachments/assets/06f7f580-2a1b-4194-8375-8ec03a3b5974) |

# 

### 💞 Special thanks/credits:

Most of these have been modified heavily, but these have still been really helpful!

- [ML4W](https://ml4w.com), for the original waybar design
- [adi1090x](https://github.com/adi1090x/rofi), for the original rofi designs
- [zDyanTB](https://github.com/zDyanTB/HyprNova), for the original swaync design 
- [Keyitdev](https://github.com/Keyitdev/sddm-astronaut-theme) and [birbkeks](https://github.com/birbkeks/win11-sddm-theme), for the SDDM themes.
