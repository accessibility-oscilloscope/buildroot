# kernel config

build using buildroot

```sh
git submodule update --init
```

using LTS buildroot tag 2021.02.6.

## building

```sh
export BR2_EXTERNAL=../oscope
make --directory=$(pwd)/buildroot O=$(pwd)/output rpi3_defconfig
```

## configuring
```sh
export MENUCONFIG_COLOR=mono # optional if ncurses colors illegible
make menuconfig
# edit some parameters
make savedefconfig
```

build,
```sh
make O=$(pwd) -C buildroot/
```

builds bootable image `images/sdcard.img`

```sh
dd if=images/sdcard.img of=[BLOCK DEVICE] status=progress bs=1M
```
