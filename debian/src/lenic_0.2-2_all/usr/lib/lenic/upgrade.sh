#!/bin/dash

# --- Lenic upgrade function - Version [cat usr/lib/lenic/VERSION] ---

CURRUSER=$(whoami)

# helper functions
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
upgradefunc() {
  apt update -y
  apt upgrade -y
  sed -i 's/$DEBIANVERS1/$DEBIANVERS2/' /etc/apt/sources.list
  apt clean
  apt update -y
  apt full-upgrade -y
  apt autoremove -y
  echo "...rebooting a successful upgrade is STRONGLY recommended!"
}

# -- actual function --
if [ "$CURRUSER" = "root" ]; then
  if [ "$1" = "shouldi" ]; then
    echo  "Little tool, which shows you, whether you need to update your system"
    echo  "Look at following statements. Do you agree with them or not?"
    echo  " You are using debian 10 or a newer version"
    echo  " You have no issues with your system and your current software"
    echo  " You have no problem with the (may outdated) versions of packages available via 'apt'"
    echo  "When you are agree to all statements, ther's no real reason, why you should upGRADE (you still need to update - for example with 'sudo lenic update')."
    echo "If you answer one of the statements with no, it may makes sence to upgrade. But be aware of the risks of upgrading and the fact, that you are not able to downgrade afterwards."
    echo "More information about upgrading can be found at http://wiki.debian.org/DebianUpgrade."
  elif [ "$1" = "buster" ]; then
    echo "Upgrade you system to buster. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    DEBIANVERS1="stretch"
    DEBIANVERS2="buster"
    COMMAND="upgradefunc"
    rusure
  elif [ "$1" = "bullseye" ]; then
    echo "Upgrade you system to bullseye. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    apt update -y
    apt upgrade -y
    sed -i 's/buster/bullseye/' /etc/apt/sources.list
    sed -i 's#http://security.debian.org/debian-security bullseye/updates main#http://deb.debian.org/debian-security/ bullseye-security main#' /etc/apt/sources.list
    apt clean
    apt update -y
    apt full-upgrade -y
    apt autoremove -y
    echo "...rebooting after a successful upgrade is STRONGLY recommended!"
    
  elif [ "$1" = "bookworm" ]; then
    echo "Upgrade you system to bookworm. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    DEBIANVERS1="bullseye"
    DEBIANVERS2="bookworm"
    COMMAND="upgradefunc"
    rusure
  elif [ "$1" = "sid" ]; then
    echo "Upgrade you system to sid. Be sure to save all data from the system first and be aware you won't be to able to downgrade aftwerwards."
    DEBIANVERS1="bookworm"
    DEBIANVERS2="sid"
    COMMAND="upgradefunc"
    rusure
  else
    echo "lenic 0.2-2 - upgrade tool"
    echo "Usage: 'lenic upgrade [debian-version-codename]'"
    echo "UPGRADE TOOL IS STILL IN ALPHA PHASE - NO WARRANTY IS GIVEN"
    echo "!!! I RECOMMEND LOOKING AT 'https://wiki.debian.org/DebianUpgrade' !!!"; echo ""
    echo "When you don't know, whether you should upGRADE your system: 'lenic upgrade shouldi' gives you more information."; echo ""
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
  fi
else
  echo "You must have root privilidges to use the lenic install tool!"
fi