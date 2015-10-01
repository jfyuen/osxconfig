# Personal OSX Config

Installation script to set up a system quickly, no fancy stuff.

Not generic run once script, debug manually.

## Installation

### OS X >= 10.11 (El Capitan)

Since OS X 10.11 introduced System Protection Integrity (SPI), the directory `/usr/local` must be created first. More details on <https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/El_Capitan_and_Homebrew.md#if-usrlocal-does-not-exist>
- Reboot in Recovery Mode (`CMD+R`)
- Disable SPI with `csrutil disable`
- Reboot normally and login
- Create `/usr/local` on the volume and set it unrestricted:
```sh
$ sudo mkdir /usr/local && sudo chflags norestricted /usr/local && sudo chown $(whoami):admin /usr/local && sudo chown -R $(whoami):admin /usr/local
```
- Reboot once again in Recovery Mode
- Reenable SPI with `csrutil enable`
- Reboot back to OS X

### Installation script

Run the install script
```sh
$ ./install.sh
```

## Uninstallation

Reinstall a system.
