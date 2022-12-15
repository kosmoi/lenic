#!/bin/dash

# --- Lenic 0.2-1 install fucntion ---

rusure() {
BOOL=$(whiptail --title "Lenic 0.3-1 -- Install tool" --yesno)
    if [ "$RUSURE" = "true" ]; then
    $COMMAND
    $COMMAND2
    else
    whiptail --title "Lenic 0.3-1 -- Help" --msgbox "...operation cancelled!"
    fi
}

SELECTION=$(whiptail --title "Lenic 0.3-1 -- Install tool" --radiolist "Choose bunch of packages to be installed\n\n       Name of bunch      included packages" 16 80 6 \
"openbox+" "openbox, tint2 and some xfce tools." OFF \
"lxqt-openbox" "lxqt-core and openbox. REMOVING xfwm4." OFF \
"basic-tools" "nano, screenfetch and htop." OFF \
"music-tools" "jack, qjackctl, audacity, zynaddsubfx and vlc." OFF \
"Exit Install tool" "" OFF \
3>&1 1>&2 2>&3)

if [ "$SELECTION" = "help" ]; then
    echo "lenic 0.2-1 - install tool"
    echo "Usage: 'lenic install [set of packages]'"; echo ""
    echo "Following sets of packages are available:"
    echo " 'openbox+' - package set containing a graphical x-window system based on openbox"
    echo " 'lxqt-openbox' - package set containing a minimal lxqt system, using openbox as window manager"
    echo " 'basic-tools' - package set containing basic tools"
    echo " 'music-tools' - package set containing programs may needed for music production"
  elif [ "$SELECTION" = "openbox+" ]; then
    COMMAND="apt install openbox tint2 thunar xarchiver mousepad xfce4-appfinder -y"
    rusure
  elif [ "$SELECTION" = "lxqt-openbox" ]; then
    COMMAND="apt install lxqt-core openbox -y"
    COMMAND2="apt autoremove xfwm4 -y"
    rusure
  elif [ "$SELECTION" = "basic-tools" ]; then
  COMMAND="apt install nano screenfetch htop -y"
    rusure
  elif [ "$SELECTION" = "music-tools" ]; then
    COMMAND="apt install jackd qjackctl audacity zynaddsubfx vlc -y"
    rusure
  else
    dash /usr/bin/lenic
  fi
