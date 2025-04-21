<div align="center">
  <h1>Geode's Dots</h1>
</div>

<div align="center">
  <p>⚠️ Testing branch! May run into issues</p>
</div>

### 🌟 INSTALLATION:

> I'm working on cleaning up the install scripts, but they should work for now.

<details> 
  <summary>⌛ Automatic (RECOMMENDED)</summary>

  <p></p>
  
  > Should work on pretty much any arch based system (minimal, or not). If thers an issue installing, please submit a bug report! 
  
  ```
  bash <(curl -s "https://geodearc.github.io/GeoDots/install-testing.sh")
  ```
 > If running this results in an error, try running `bash` beforehand, then try again.

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
  git clone -b testing --single-branch https://github.com/GeodeArc/GeoDots
  cd GeoDots
  ./install.sh
  ```
</details> 

<details> 
  <summary>🐧 Actually Manual</summary>

  <p></p>
    
  - 🗃️ Ensure the dependencies listed in /Dots/Scripts/Installation/pkgs/ are installed

  - 🔶 Go to each config folder in /.config/, and put a config (e.g light alt waybar, GTK hyprland.conf), and move it to the root of that config folder

  - 💾 Copy folders from /.config/ to your .config folder

  - 💫 Copy the /Dots folder to your home directory.

</details> 
