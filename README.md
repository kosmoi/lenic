# Lenic

## About

Lenic, which stands for "little executable nonsence interactive console" is a command line tool for debian systems, which offers some commands doing work for you, providing following features (unchecked in progress).

- [x] Installing set of packages
- [x] Update your system (get security updates and some others)
- [x] create a template folder for building deb packages
- [x] Ported to from bash to dash, which is faster and POSIX-comaptible
- [x] outsourced functions to /usr/lib/lenic for better performance and better seperation
- [x] Upgrade your system to the next debian release -- still not perfect
- [x] Changing settings of openbox (autostart, menu) -- still not perfect
- [ ] versions for other distros (LinuxMint, Ubuntu)

## Install

### Debian

Download and installation works with a seperated shell script to make it easier to install lenic. To install the newest (stable) version of lenic, just execute following command:

`sudo apt install wget -y && sudo wget https://raw.githubusercontent.com/kosmoi/lenic/main/install-lenic-debian.sh && sudo chmod a+x install-lenic-debian.sh && sudo dash install-lenic-debian.sh && rm install-lenic-debian.sh`

The commands first installs "wget" on your system, then downloads a install script, makes it executable, executes it and removes the script. The installation script can be found at http://github.com/kosmoi/lenic/blob/main/install-lenic-debian.sh

Type 'lenic' in your terminal to use Lenic.

## Information

Changelogs: https://github.com/kosmoi/lenic/blob/main/information/changelogs.md

News and Announcements: https://github.com/kosmoi/lenic/blob/main/information/news-announcements.md
