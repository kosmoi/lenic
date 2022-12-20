#!/bin/dash
# Shell script for installing current lenic version for debian using the deb file provided by kosmoi

CURRUSER=$(whoami)

if [ "$CURRUSER" = "root" ]; then
# preinst
apt remove lenic -y
apt install dash wget -y
# installation of lenic
wget kosmoi.github.io/lenic-debian/lenic_0.2-2_all.deb
apt install ./lenic_0.2-2_all.deb
# postinst
rm lenic_0.2-2_all.deb
chmod a+x /usr/bin/lenic
chmod a+x /usr/lib/lenic/*.sh
# information for the user
echo ""; echo "...Installation of lenic complete. To run lenic type 'lenic' in the command prompt. To remove lenic run 'sudo apt remove lenic'"
else
echo "You need root privilidges to run this script!"
fi