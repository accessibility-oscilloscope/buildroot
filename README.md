# kernel config

build using buildroot

```sh
git submodule init
git submodule update
```

using LTS buildroot tag 2021.02.6

## building

```sh
make O=`pwd` -C buildroot/
```

builds bootable image `images/sdcard.img`

```sh
dd if=images/sdcard.img of=[BLOCK DEVICE] status=progress bs=1M
```

