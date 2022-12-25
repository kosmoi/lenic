#!/bin/dash
# --- Lenic about function - Version [cat usr/lib/lenic/VERSION] ---
VERSION=$(cat /usr/lib/lenic/VERSION)
RELEASE_DATE=$(cat /usr/lib/lenic/RELEASE_DATE)

echo "   __            _"
echo "  / /  ___ ___  (_)___"
echo " / /__/ -_) _ \/ / __/"
echo "/____/\__/_//_/_/\__/"
echo ""
echo "Lenic version $VERSION - DEB-Package"
echo "Creator: kosmoi"
echo "Website: kosmoi.github.io/lenic"
echo "License: kosmoi.github.io/license.htm"
echo "Description: Lenic (which stands for 'little executable nonsence interactive console') is a tool, which was made for handling debian system more easily."
echo ""
echo "released on $RELEASE_DATE"
