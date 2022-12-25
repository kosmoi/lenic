#!/bin/dash
# --- Lenic openbix function - Version [cat usr/lib/lenic/VERSION] ---
VERSION=$(cat /usr/lib/lenic/VERSION)
LOOPBOOL="true"

if [ "$USER" = "root" ]; then
clear
echo "Lenic $VERSION - openbox configuration tool"; echo ""
echo ""; echo "Options available in the lenic Openbox config tool:"; echo ""
echo "-> 'a' - edit openbox autostart file"
echo "-> 'm' - edit openbox menu file"
echo "-> 'q' - exit lenic openbox tool"; echo ""
while [ "$LOOPBOOL" = "true" ]; do
  read -p "Enter parameter > " INPUT_1
  if [ "$INPUT_1" = "a" ] || [ "$INPUT_1" = "A" ]; then
  read -p "Display an information dialog about the openbox autostart file? [Y/n] " RUSURE
  if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
  echo ""; echo "--- EDITING THE OPENBOX AUTOSTART FILE ---"; echo ""
  echo "The openbox autostart file defines which commands runs every time you log into an openbox session. This can be helpful because you can set an background image or start a panel automatically, for example."
  echo "RULES:"
  echo "-> the whole text in a line after a '#' will be ignored"
  echo "-> each command run on startup should be get its own line and there should be a '&' after each command"; echo ""
  echo "Example autostart file:"
  echo "loadkeys de &"; echo "# loads german keyboard configuration"
  echo "feh --bg-scale /path/to/background-image.png &"; echo "# sets a background image, when 'feh' is installed"
  echo "tint2 &"; echo "# launches the tint2 panel, when it's installed"; echo ""
  read -p "Open openbox autostart file? [Y/n] " YNPROMT
  if [ "$YNPROMT" = "y" ] || [ "$YNPROMT" = "Y" ] || [ "$YNPROMT" = "" ]; then
  nano /etc/xdg/openbox/autostart
  else
  echo "...operation cancelled"; echo ""
  fi
  else
  echo ""
  nano /etc/xdg/openbox/autostart
  fi
  elif [ "$INPUT_1" = "m" ] || [ "$INPUT_1" = "M" ]; then
  nano /etc/xdg/openbox/menu.xml
  elif [ "$INPUT_1" = "q" ] || [ "$INPUT_1" = "Q" ]; then
  LOOPBOOL="false"
  else
  clear
  echo ""; echo "Options available in the lenic Openbox config tool:"; echo ""
  echo "-> 'a' - edit openbox autostart file"
  echo "-> 'm' - edit openbox menu file"
  echo "-> 'q' - exit lenic openbox tool"; echo ""
  fi
done
else
echo "You must have root privilidges to use the lenic install tool!"
fi