# Lenic

## About

Lenic, which stands for "little executable nonsence interactive console" is a command line tool for debian systems, which offers some commands doing work for you, providing following features (unchecked in progress).

- [x] Installing set of packages
- [x] Update your system (get security updates and some others)
- [x] create a template folder for building deb packages
- [ ] port Lenic to DASH - DASH is faster than BASH and with current features, there's no reason to use still BASH -- coming with version 0.2-1
- [ ] outsource scripts to "/usr/lib/lenic/" ("/usr/bin/lenic" will be easier to read) -- coming with version 0.2-1
- [ ] Upgrade your system to the next debian release, using just one command -- already as experimental feature available
- [ ] integration of an TUI with whiptail -- coming with 0.3-1
- [ ] Changing settings of openbox (autostart, menu)
- [ ] versions for other distros (LinuxMint, Ubuntu)

## Download
### Debian

I recommend using the DEB-Version of Lenic.
For installing the deb-version, first open a terminal and simply type these three commands one after another.

First this one to download the deb-file:

`wget http://kosmoi.github.io/lenic_0.1.2-1_all.deb`

and then install it with executing

`sudo apt install ./lenic_0.1.2-1_all.deb`

Now it's installed. You maybe want to delete the deb-file with

`rm lenic_0.1.2-1_all.deb`

## Usage

Simply type 'lenic' in your terminal.
