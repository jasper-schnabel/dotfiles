# Archlinux installation guide

> Note: This is an installation guide for personal use, therefore no guarantee and at your own risk!

## Requirements

- any x86_64 compatible machine
- at least 2 GB of RAM and 10 GB of free storage
- an usb drive, to create a bootable drive
- internet (preferably ethernet)

## Preinstall

#### Download ISO

Visit the archlinux [download](https://archlinux.org/download/) page and download the latest ISO file.

#### Create a bootable usb drive

```
dd if=/path/to/archlinux.iso of=/dev/usb_drive status=progress bs=4M
```

## Install

#### Boot into archlinux

Restart you machine and boot from your bootable usb drive into archlinux.

#### Set the keyboard layout

```
loadkeys de-latin1
```

#### Verify the boot mode

```
ls /sys/firmware/efi/efivars
```
If the directory does not exists, the system maybe booted in BIOS (which will not work for this guide).

#### Check internt connection

```
ping archlinux.org -c 3
```

#### Partitioning the drive

```
lsblk

fdisk /dev/main_partition

	F	to list free unpartitioned space
	n	to create new boot partition (between at least 200 MB and 300 MB)
	l	to list partition types
	t	to change boot partiton type to 'EFI System'
	n	to create new root partition (the rest of your free space)
	p	to print the partition table (to check if everything is correct)
 	w	to write changes and exit fdisk
```

#### Format partitions

```
mkfs.ext4 /dev/root_partition
mkfs.fat -F32 /dev/boot_partition
```

#### Mount partitions

```
mount /dev/root_partition /mnt
mkdir /mnt/boot
mount /dev/boot_partition /mnt/boot
lsblk
```

#### Install system and basic packages

```
pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr os-prober networkmanager neovim git zsh
```

#### Generate fstab

```
genfstab -U /mnt > /mnt/etc/fstab
```

#### Access newly-installed system

```
arch-chroot /mnt
```

#### Set root password

```
passwd
```

#### Enable networking

```
systemctl enable NetworkManager
```

#### Setup time zone

```
timedatectl set-ntp true
timedatectl set-timezone Europe/Berlin
hwclock --systohc
timedatectl status
```

#### Localization

Use `nvim /etc/locale.gen` to uncomment:

```
#de_DE.UTF-8 UTF-8 <br>
#de_DE ISO-8859-1 <br>
#de_DE@euro ISO-8859-15 <br>
#en_US.UTF-8 UTF-8 <br>
#en_US ISO-8859-1
```

```
locale-gen
localectl set-locale LANG=en_US.UTF-8
```

#### Keyboard


Use `nvim /etc/vconsole.conf` to add:

```
KEYMAP=de-latin1
```

#### Boot loader and windows setup

Use `nvim /etc/default/grub` to add:

```
GRUB_DISABLE_OS_PROBER=false
```

```
os-prober
mkdir /boot-windows
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Grub

fdisk /dev/main_partition
	p	to see which partition is the windows_boot_partition
	q	to quit

mount /dev/windows_boot_partition /boot-windows
lsblk
grub-mkconfig -o /boot/grub/grub.cfg
```

#### Reboot the system

```
exit
umount -R /mnt
reboot
```

## Postinstall

#### Add user

```
loadkeys de-latin1
usermod -s /bin/zsh root
useradd -m -s /bin/zsh -G wheel my_username
passwd my_username
```

#### Pacman color, sudo permissions

Use `nvim /etc/pacman.conf` to uncomment:

```
#Color
```

Use `nvim /etc/sudoers` to uncomment or add:

```
#%wheel ALL=(ALL) ALL
#%wheel ALL=(ALL) NOPASSWD: /usr/bin/light
```

#### Change user

`exit`

#### Install paru

```
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd
```

#### Install packages and dotfiles

```
git clone https://github.com/jasper-schnabel/dotfiles.git .
install-dotfiles
```

#### Enable and start services

```
sudo systemctl enable --now bluetooth
sudo systemctl enable --now cups
```

#### Hostname

```
hostnamectl set-hostname my_hostname
hostnamectl
```

#### Xorg Keyboard and shell

```
localectl set-x11-keymap de pc104 nodeadkeys
sudo ln -sfT dash /bin/sh
```

#### Last step

```
reboot
```
