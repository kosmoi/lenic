# Lenic

## About

Lenic, which stands for "little executable nonsence interactive console" is a command line tool for debian systems, which offers some commands doing work for you, providing following features (unchecked in progress).

- [x] Installing set of packages
- [x] Update your system (get security updates and some others)
- [x] create a template folder for building deb packages
- [x] Ported to from bash to dash, which is faster and POSIX-comaptible
- [x] outsourced functions to /usr/lib/lenic for better performance and better seperation
- [ ] Upgrade your system to the next debian release, using just one command -- available as experimental feature
- [ ] Changing settings of openbox (autostart, menu)
- [ ] versions for other distros (LinuxMint, Ubuntu)

## Install

### Debian

Download and installation works with a seperated shell script to make it easier to install lenic. To install the newest (stable) version of lenic, just execute following commands one after another:

`sudo apt install wget -y`

to install wget, when it's not installed on your system

`wget kosmoi.github.io/install-debian.sh`

to download the install script

`chmod a+x install-debian.sh`

to make it executable

`sudo dash install-debian.sh`

to run the install script

`rm install-debian.sh`

to remove the install script, which isn't needed any more ;-)
For using lenic simply type 'lenic' in your terminal.

## Information

Changelogs: https://github.com/kosmoi/lenic/blob/main/information/changelogs.md

News and Announcements: https://github.com/kosmoi/lenic/blob/main/information/news-announcements.md
