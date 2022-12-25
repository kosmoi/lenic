#!/bin/dash
# --- Lenic install function - Version [cat usr/lib/lenic/VERSION] ---
VERSION=$(cat /usr/lib/lenic/VERSION)

rusure() {
echo ""
read -p "Do you want to continue? [Y/n] " RUSURE
  if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
  $COMMAND
  $COMMAND2
  else
  echo "...operation canceled"
  fi
}

if [ "$USER" = "root" ]; then
if [ "$1" = "openbox+" ]; then
  echo "Installing following packages:"; echo "openbox, tint2, its dependencies and some xfce tools."
  COMMAND="apt install openbox tint2 thunar thunar-archive-plugin mousepad xfce4-appfinder xfce4-terminal nano -y"
  rusure
elif [ "$1" = "lxqt-openbox" ]; then
  echo "Installing/REMOVING following packages:"; echo " installing lxqt-core, openbox and its dependencies, REMOVING xfwm4 and its dependecies."
  COMMAND="apt install lxqt-core openbox -y"
  COMMAND2="apt autoremove xfwm4 -y"
  rusure
elif [ "$1" = "basic-tools" ]; then
  echo "Installing following packages:"; echo " nano, screenfetch, tree, htop and its dependencies."
  COMMAND="apt install nano screenfetch htop tree -y"
  rusure
elif [ "$1" = "music-tools" ]; then
  echo "Installing following packages:"; echo " jack, qjackctl, audacity, zynaddsubfx, vlc and its dependencies."
  COMMAND="apt install jackd qjackctl audacity zynaddsubfx vlc -y"
  rusure
else
  echo "lenic $VERSION - install tool"
  echo "Usage: 'lenic install [set of packages]'"; echo ""
  echo "Following sets of packages are available:"
  echo " 'openbox+' - package set containing a graphical x-window system based on openbox"
  echo " 'lxqt-openbox' - package set containing a minimal lxqt system, using openbox as window manager"
  echo " 'basic-tools' - package set containing basic tools"
  echo " 'music-tools' - package set containing programs may needed for music production"
fi
else
  echo "You must have root privilidges to use the lenic install tool!"
fi
