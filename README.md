# kernel config

build using buildroot

```sh
git submodule update --init
```

using LTS buildroot tag 2021.02.6

## building

make any buildroot configuration changes then save,
```sh
cd buildroot
MENUCONFIG_COLOR=mono BR2_EXTERNAL=../oscope make menuconfig
```

```sh
MENUCONFIG_COLOR=mono make linux-menuconfig
```

build,
```sh
cd ../
make O=$(pwd) -C buildroot/
```

builds bootable image `images/sdcard.img`

```sh
dd if=images/sdcard.img of=[BLOCK DEVICE] status=progress bs=1M
```
Warning WSL usually doesn't support the above unless you've got a special usb to WSL forwarder
