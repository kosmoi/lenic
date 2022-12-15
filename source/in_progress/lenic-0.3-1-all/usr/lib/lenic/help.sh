#!/bin/dash

# --- Lenic 0.2-1 help function ---



whiptail --title "Lenic 0.3-1 -- Help" --msgbox \
" lenic 0.3-1
 Usage: 'lenic [command]'

 Following tools are available:
  -'help' - lists all available tools
  -'install' - installs bunch of packages
  -'update' - updates for your system
  -'upgrade' - upgrade your system to another debian release (EXPERIMENTAL)
  -'debtemplate' - template folder for building deb packages
  -'about' - information about the program" 20 65

dash /usr/bin/lenic
