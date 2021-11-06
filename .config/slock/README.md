# slock - simple screen locker

simple screen locker utility for X.

### Requirements

In order to build slock you need the Xlib header files.

### Patches

- blur pixelated screen
- dpms

### Installation

Edit config.mk to match your local setup (slock is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install slock
(if necessary as root):

```
make clean install
```

### Running slock

See the man page for details.
