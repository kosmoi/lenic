#!/bin/dash
# --- Lenic help function - Version [cat usr/lib/lenic/VERSION] ---
VERSION=$(cat /usr/lib/lenic/VERSION)

echo "Lenic $VERSION"
echo "Usage: 'lenic [options]'"; echo ""
echo "Following options are available:"
echo "-> 'help' - lists all available commands"
echo "-> 'install' - runs a tool, which can installs bunch of packages"
echo "-> 'update' - updates your system"
echo "-> 'upgrade' - runs a tool which can upgrade your system to another debian release -- STILL IN ALPHA PHASE"
echo "-> 'debtemplate' - tool making templates for building deb packages"
echo "-> 'sysinfo' - gives you information about your system."
echo "-> 'openbox' - let you change openbox settings manually"
echo "-> 'about' - gives you information about the program"
