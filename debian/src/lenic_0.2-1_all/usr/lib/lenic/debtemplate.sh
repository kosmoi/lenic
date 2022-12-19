#!/bin/dash

# --- Lenic 0.2-1 debtemplate function ---

# ---1---
  if [ "$1" = "help" ]; then
    echo "lenic 0.2-1 - debtemplate tool"
    echo "Usage: 'lenic debtemplate [location of template folder]'"
  elif [ "$1" = "" ]; then
    echo "Try 'lenic debtemplate help' for more information."
  else
  echo "Creating a temlate folder for creating a DEB-Package."; echo ""
  read -p "Do you want to continue? [Y/n] " RUSURE
  #---2---
    if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
    # CURRENTLOCATION="$PWD"
    mkdir "$PWD/$1"
    mkdir "$PWD/$1/DEBIAN"
    mkdir "$PWD/$1/usr"
    mkdir "$PWD/$1/usr/share"
    mkdir "$PWD/$1/usr/share/icons"
    mkdir "$PWD/$1/usr/share/applications"
    mkdir "$PWD/$1/usr/bin"
    cat > "$PWD/$1/DEBIAN/control" << ENDOFFILE
Package: PackageName
Name: PackageName
Author: name
Maintainer: name
Version: 1.0-1
Section: 
Pre-Depends: package1, package2
Depends: package1, package2
Recommends: package1, package2
Suggests: package1, package2
Enhances: package1, package2
Replaces: package1, package2
Conflicts: package1, package2
Breaks: package1, package2
Provides: package1, package2
Architecture: archs
Essential: no
Prioty: optional
Homepage: https://websitename
Website: https://websitename
Icon: /usr/share/icons/filename.png
Description: An example package.
longer description
ENDOFFILE
  cat > "$PWD/$1/usr/share/applications/programname.desktop" << ENDOFFILE
[Desktop entry]
Version=1.0-1
Name=ProgramName
GenericName=ProgramName
Comment=Description
Exec=/usr/bin/programname
TryExec=/usr/bin/programname
Icon=/usr/share/icons/filename.png
Terminal=true
Type=Application
Categories=cat;
ENDOFFILE
  cat > "$PWD/$1/usr/bin/programname" << ENDOFFILE
!/bin/bash
# [programname] [version]
ENDOFFILE
  chmod +x "$PWD/$1/usr/bin/programname"
  else
    echo "...operation canceled"
  fi
fi
    
