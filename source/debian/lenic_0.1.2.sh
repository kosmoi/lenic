#!/bin/bash

# Lenic 0.1

VERSION="0.1.2"

ANSWER1=$1
ANSWER2=$2

#functions

function rusure() {
  echo ""
  read -p "Do you want to continue? [Y/n] " RUSURE
    if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
    $COMMAND
    $COMMAND2
    else
    echo "...operation canceled"
    fi
}

function upgradefunc() {
  apt update -y
  apt upgrade -y
  sed -i 's/$DEBIANVERS1/$DEBIANVERS2/' /etc/apt/sources.list
  apt clean
  apt update -y
  apt full-upgrade -y
  apt autoremove -y
  echo "...rebooting is STRONGLY recommended!"
}




function help() {
  echo "lenic $VERSION"
  echo "Usage: 'lenic [command]'"; echo ""
  echo "Following commands are available:"
  echo " 'help' - lists all available commands"
  echo " 'install' - runs a tool, which can installs bunch of packages"
  echo " 'update' - updates your system"
  echo " 'upgrade' - runs a tool which can upgrade your system to another debian release"
  echo " 'about' - gives you information about the program"
}

# ----- INSTALL FUNCTION ------
function install2() {
  if [ "$ANSWER2" = "help" ]; then
    echo "lenic $VERSION - install tool"
    echo "Usage: 'lenic install [set of packages]'"; echo ""
    echo "Following sets of packages are available:"
    echo " 'openbox+' - package set containing a graphical x-window system based on openbox"
    echo " 'lxqt-openbox' - package set containing a minimal lxqt system, using openbox as window manager"
    echo " 'basic-tools' - package set containing basic tools"
    echo " 'music-tools' - package set containing programs may needed for music production"
  elif [ "$ANSWER2" = "openbox+" ]; then
    echo "Installing following packages:"; echo "openbox, tint2, its dependencies and some xfce tools."
    COMMAND="apt install openbox tint2 thunar xarchiver mousepad xfce4-appfinder -y"
    rusure
  elif [ "$ANSWER2" = "lxqt-openbox" ]; then
    echo "Installing/REMOVING following packages:"; echo " installing lxqt-core, openbox and its dependencies, REMOVING xfwm4 and its dependecies."
    COMMAND="apt install lxqt-core openbox -y"
    COMMAND2="apt autoremove xfwm4 -y"
    rusure
  elif [ "$ANSWER2" = "basic-tools" ]; then
    echo "Installing following packages:"; echo " nano, screenfetch, htop and its dependencies."
    COMMAND="apt install nano screenfetch htop -y"
    rusure
  elif [ "$ANSWER2" = "music-tools" ]; then
    echo "Installing following packages:"; echo " jack, qjackctl, audacity, zynaddsubfx, vlc and its dependencies."
    COMMAND="apt install jackd qjackctl audacity zynaddsubfx vlc -y"
    rusure
  else
    echo "Try 'lenic install help' for more information"
  fi
}

function update() {
  echo "Get security updates and may some other updates for your system."
  COMMAND="apt update -y"
  COMMAND2="apt upgrade -y"
  rusure
}

function upgrade() {
  if [ "$ANSWER2" = "help" ]; then
    echo "lenic $VERSION - upgrade tool"
    echo "Usage: 'lenic upgrade [debian-version-codename]'"; echo ""
    echo "When you don't know, wether you should upGRADE your system: 'lenic upgrade shouldi' gives you more information."; echo ""
    echo "Debian version number:"
    cat /etc/debian_version; echo ""
    echo "The codename of your version you are using now is"
    echo " 'stretch' - when your debian verion number starts with 9"
    echo " 'buster' - when your debian verion number starts with 10"
    echo " 'bullseye' - when your debian verion number starts with 11"
    echo " 'bookworm' - when your debian verion number starts with 12"
    echo " 'sid' - when your debian verion number starts with 13 (you are using the latest version of debian)"
    echo "To update your system type 'lenic upgrade' plus the codename of your FOLLOWING version."; echo ""
    echo "Example: When your debian version number is 11, then the codename of the version you are using is 'bullseye'. To upgrade your system you have to type 'lenic upgrade bookworm', because 'bookworm' is the codename of the following version."
  elif [ "$ANSWER2" = "shouldi" ]; then
    echo "Little tool, which shows you, whether you need to update your system"
    echo "Look at following statements. Do you agree with them or not?"
    echo " You are using debian 10 or a newer version"
    echo " You have no issues with your system and your actual software"
    echo " You have no problem with the (may outdated) versions of packages available via 'apt'"
    echo "When you are agree to all statements, ther's no real reason, why you should upGRADE (you still need to update - for example with 'sudo lenic update')."
    echo "If you answer one of the statements with no, it may makes sence to upgrade. But be aware of the risks of upgrading and the fact, that you are not able to downgrade afterwards."
    echo "More information about upgrading can be fuond at <http://wiki.debian.org/DebianUpgrade."
  elif [ "$ANSWER2" = "buster" ]; then
    echo "Upgrade you system to buster. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    DEBIANVERS1="stretch"
    DEBIANVERS2="buster"
    COMMAND="upgradefunc"
    rusure
  elif [ "$ANSWER2" = "bullseye" ]; then
    echo "Upgrade you system to bullseye. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    apt update -y
    apt upgrade -y
    sed -i 's/buster/bullseye/' /etc/apt/sources.list
    sed -i 's#security.debian.org/#security.debian.org/debian-security#' /etc/apt/sources.list
    sed -i 's#bullseye/updates#bullseye-security#' /etc/apt/sources.list
    apt clean
    apt update -y
    apt full-upgrade -y
    apt autoremove -y
    echo "...rebooting is STRONGLY recommended!"
    
  elif [ "$ANSWER2" = "bookworm" ]; then
    echo "Upgrade you system to bookworm. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    DEBIANVERS1="bullseye"
    DEBIANVERS2="bookworm"
    COMMAND="upgradefunc"
    rusure
  elif [ "$ANSWER2" = "sid" ]; then
    echo "Upgrade you system to sid. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    DEBIANVERS1="bookworm"
    DEBIANVERS2="sid"
    COMMAND="upgradefunc"
    rusure
  else
    echo "Lenic upgrade tool for debian. Try 'lenic upgrade help' for more information!"
  fi
  }


function about() {
  echo "   __            _"
  echo "  / /  ___ ___  (_)___"
  echo " / /__/ -_) _ \/ / __/"
  echo "/____/\__/_//_/_/\__/"
  echo ""
  echo "Lenic version $VERSION - DEB-Package"
  echo "Creator: kosmoi.github.io"
  echo "Website: kosmoi.github.io/lenic"
  echo "License: kosmoi.github.io/license"
  echo "Description: Lenic (which stands for 'little executable nonsence interactive console') is a tool, which was made for handling debian system more easily."
  echo ""
  echo "released"
}


function checkinput() {
  if [ "$ANSWER1" = "help" ]; then
    help
  elif [ "$ANSWER1" = "install" ]; then
    install2
  elif [ "$ANSWER1" = "update" ]; then
    update
  elif [ "$ANSWER1" = "upgrade" ]; then
    upgrade
  elif [ "$ANSWER1" = "about" ]; then
    about
  else
    echo "Try 'lenic help' for more information!"
  fi	
}

# Program

checkinput