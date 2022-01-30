# kernel config

build using buildroot

```sh
git submodule update --init
```

using LTS buildroot tag 2021.02.6

## building

make any configuration changes then save,
```sh
MENUCONFIG_COLOR=mono BR2_EXTERNAL=../oscope make menuconfig
```

build,
```sh
make O=$(pwd) -C buildroot/
```

builds bootable image `images/sdcard.img`

```sh
dd if=images/sdcard.img of=[BLOCK DEVICE] status=progress bs=1M
```
