<div align="center">
  <h1>Geode's Dots</h1>
</div>

<div align="center">
  <p>⚠️ This is a VERY VERY unfinished project! While it should be installable, you may run into issues.</p>
  <p>❤️ Many things arent finished, stay tuned for more!</p>
</div>

> [!NOTE]
> This will only work for Arch Linux. This MAY change in the future, no guarantees though.

### 🌟 INSTALLATION:

<details> 
  <summary>⌛ Automatic (RECOMMENDED)</summary>

  <p></p>
  
  > Should work on pretty much any arch based system (minimal, or not). If thers an issue installing, please submit a bug report! 
  
  ```bash
  bash <(curl -s "https://geodearc.github.io/GeoDots/install.sh")
  ```
  
 > I'm working on cleaning up the install scripts, but they should work for now.
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

# 

### 🖼️ SCREENSHOTS:

![dots 1](https://github.com/user-attachments/assets/65eca131-0196-47e3-ba4f-c87f75a48c6e)

![dots 2](https://github.com/user-attachments/assets/e682a2a9-1e13-40ed-8680-3514e7ecaeb9)

![dots 3](https://github.com/user-attachments/assets/d01c9cfe-2b76-4bd6-a287-489c7626428b)

![dots 4](https://github.com/user-attachments/assets/724c384d-9d3a-43cd-adf1-7f9786d9d848)

# 

### ⚙ MORE:

<details> 
  <summary>🟡 Roadmap</summary>
  <h3>Current:</h3>

  - Clean up rofi/swaync/hyprland configs.
  
  - Font choices (rofi kitty etc)
  
  - Add ZSH/Bash selection
    
  - Add auto install
    
  - Add cursor (bibata modern ice/classic depending on light/dark theme) (1/2)

  - NVIDIA selection (i folded)
    
  <h3>Later:</h3>
  
  - GDM config (Ready to be merged)
  
  - Add monitor setup to post install
    
  - Settings/config script
    
  - Add hyprlock autologon (maybe with sddm since that seems easy)
</details> 

# 

### 💞 Special thanks/credits:
- ML4W, for the original waybar design (https://ml4w.com)
- adi1090x, for the original rofi designs (https://github.com/adi1090x/rofi)
- zDyanTB, for the original swaync design (https://github.com/zDyanTB/HyprNova)
- birbkeks, for the SDDM theme (more theme options probably coming soon).
