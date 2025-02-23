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
  bash <(curl -s "https://geodearc.github.io/GeoDots/autoinstall.sh")
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
![Dots 1](https://github.com/user-attachments/assets/58ec042b-2fa6-4fc3-9a6b-aebfde197afc)

![Dots 2](https://github.com/user-attachments/assets/510848f9-4be8-465f-8c87-29b1bf4fc418)

![Dots 3](https://github.com/user-attachments/assets/257173da-a71f-4501-8909-76d178040656)

![image](https://github.com/user-attachments/assets/7cf8db7c-b7e1-4c32-aa70-027477feccec)

# 

### ⚙ MORE:

<details> 
  <summary>🟡 Roadmap</summary>
  <h3>Current:</h3>
  
  - Font choices (rofi kitty etc)
  
  - Add ZSH/Bash selection
    
  - Add auto install
    
  - Add cursor (bibata modern ice/classic depending on light/dark theme)
    
  - Proper light/dark theme support (waybar✅, gtk3/4✅, swaync❌, rofi❌)
    
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
