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

builds bootable image `images/sdcard.img` (sha1sum e623aee9f5e279a23bc82c0d944e5829c84e796b)

```sh
dd if=images/sdcard.img of=[BLOCK DEVICE] status=progress bs=1M
```

