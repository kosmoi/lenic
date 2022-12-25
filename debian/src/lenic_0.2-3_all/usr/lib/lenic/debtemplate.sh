#!/bin/dash
# --- Lenic debtemplate function - Version [cat usr/lib/lenic/VERSION] ---
VERSION=$(cat /usr/lib/lenic/VERSION)

# ---1---
if [ "$1" = "make" ]; then
echo "Creating a temlate folder in $PWD for creating a DEB-Package."; echo ""
read -p "Do you want to continue? [Y/n] " RUSURE
#---2---
if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
  mkdir "$PWD/$2"
  mkdir "$PWD/$2/DEBIAN"
  mkdir "$PWD/$2/usr"
  mkdir "$PWD/$2/usr/share"
  mkdir "$PWD/$2/usr/share/icons"
  mkdir "$PWD/$2/usr/share/applications"
  mkdir "$PWD/$2/usr/bin"
    cat > "$PWD/$2/DEBIAN/control" << ENDOFFILE
Package: PackageName
Name: PackageName
Author: name
Maintainer: name
Version: 1.0-1
Depends: package1, package2
Recommends: package1, package2
Suggests: package1, package2
Replaces: package1, package2
Conflicts: package1, package2
Breaks: package1, package2
Architecture: all
Essential: no
Prioty: optional
Homepage: https://websitename
Website: https://websitename
Icon: /usr/share/icons/filename.png
Description: An example package.
longer description
ENDOFFILE
# ----------
  cat > "$PWD/$2/usr/share/applications/programname.desktop" << ENDOFFILE
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
# ----------
  cat > "$PWD/$2/usr/bin/programname" << ENDOFFILE
#!/bin/sh
#ATTENTION: edit line above to "#!/bin/dash" or "#!/bin/bash" to be sure to use dash/bash
# -x-
# [programname] [version]
ENDOFFILE
chmod +x "$PWD/$2/usr/bin/programname"
else
  echo "...operation canceled"
fi
#----------------
else
  echo "lenic $VERSION - debtemplate tool"
  echo "Usage: 'lenic debtemplate make [name of the project]'"; echo ""
  echo "A folder named after the project will be created at your current location."
  echo "There will be a promt asking you whether it should continue."
fi
    
