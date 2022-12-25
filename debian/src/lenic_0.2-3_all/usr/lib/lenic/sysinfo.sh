#!/bin/dash
# --- Lenic sysinfo function - Version [cat usr/lib/lenic/VERSION] ---
VERSION=$(cat /usr/lib/lenic/VERSION)
DEBVERS=$(cat /etc/debian_version)

echo "Lenic $VERSION - sysinfo tool"; echo ""
echo "Debian version: $DEBVERS"
echo "Linux Kernel: $(uname -r)"
echo "Standard shell: $SHELL"
echo "Environment type: $XDG_SESSION_TYPE"
echo "Current user: $USER"
echo "Current directory: $PWD"
echo "Language: $LANG"