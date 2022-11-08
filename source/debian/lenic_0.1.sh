#!/bin/bash

# Lenic 0.1

VERSION="0.1"

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
  echo "upgrade tool in progress as of 2022-11-08"
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
  echo "released on 2022-11-08"
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
