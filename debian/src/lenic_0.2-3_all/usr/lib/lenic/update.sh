#!/bin/dash
# --- Lenic update function - Version [cat usr/lib/lenic/VERSION] ---

if [ "$USER" = "root" ]; then
if [ "$1" = "y" ] || [ "$1" = "Y" ]; then
apt update -y && apt upgrade -y
else
echo "Get security updates and may some other updates for your system."
echo ""
read -p "Do you want to continue? [Y/n] " RUSURE
  if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
    apt update -y && apt upgrade -y
  else
    echo "...operation canceled"
  fi
fi
else
  echo "You must have root privilidges to use the lenic install tool!"
fi