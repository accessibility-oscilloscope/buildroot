# buildroot

get the buildroot submodule,

```sh
git submodule update --init
```

built using buildroot LTS tag 2021.02.6.

## supported boards

- rpi3 (porting)
- rpi4 (untested)
- qemu (porting)

## system packages
on the host system, the minimum build requirements:

- which
- sed
- make >=3.81
- binutils
- build-essential (only for Debian based systems)
- gcc >=4.8
- g++ >=4.8
- bash
- patch
- gzip
- bzip2
- perl >=5.8.7
- tar
- cpio
- unzip
- rsync
- file (must be in /usr/bin/file)
- bc

## building
set `DEFCONFIG` to one of the [supported boards](#supported-boards), `DEFCONFIG=rpi3` for example.
first, configure

```sh
. env.sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output ${DEFCONFIG}_defconfig
```

see [configuring](#configuring) if you'd like to audit the configuration.
then build,

```sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output
```

for hardware targets, this builds bootable image `${DEFCONFIG}_output/images/sdcard.img`.

## emulation
build `DEFCONFIG=qemu` and install `qemu-system-arm`.

```sh
./emu.sh qemu_output/
```

## configuring
requries `libncurses-dev`.

### buildroot
```sh
. env.sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output menuconfig
...  # change some parameters, save
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output # rebuild
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output savedefconfig # save those changes, updates corresponding configs `accessilbility-oscilloscope/config/`.
```

### kernel
```sh
. env.sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output linux-menuconfig
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output linux-savedefconfig
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output linux-update-defconfig
```

### multi-board development
just change the $DEFCONFIG to the current board being developed.
