# kernel config

build using buildroot LTS tag 2021.02.6.

```sh
git submodule update --init
```

## system packages
- which
- sed
- make (version 3.81 or any later)
- binutils
- build-essential (only for Debian based systems)
- gcc (version 4.8 or any later)
- g++ (version 4.8 or any later)
- bash
- patch
- gzip
- bzip2
- perl (version 5.8.7 or any later)
- tar
- cpio
- unzip
- rsync
- file (must be in /usr/bin/file)
- bc 

## building
supported $DEFCONFIG
- rpi3 (porting)
- rpi4 (untested)
- qemu (porting)

```sh
export BR2_EXTERNAL=../accessibility-oscilloscope
make --directory=$(pwd)/buildroot O=$(pwd)/output $DEFCONFIG_defconfig
```

see `configuring` if you'd like to audit configuration settings.
to build,

```sh
make --directory=$(pwd)/buildroot O=$(pwd)/$DEFCONFIG_output
```

builds bootable image `output/images/sdcard.img`

```sh
dd if=output/images/sdcard.img of=[BLOCK DEVICE] status=progress bs=1M
```

## configuring
requries `libncurses-dev`.

```sh
export MENUCONFIG_COLOR=mono # optional, if ncurses colors illegible
make menuconfig
# edit some parameters
make savedefconfig
```
