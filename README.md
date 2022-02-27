# buildroot

get the buildroot submodule,

```sh
git submodule update --init
```

built using buildroot LTS tag 2021.02.6.

## supported boards
supported $DEFCONFIG
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
for a given board $DEFCONFIG (see `supported boards`)

```sh
. env.sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output ${DEFCONFIG}_defconfig
```

this generates appropriate configurations for your system.
see `configuring` if you'd like to audit the configuration.

to build,

```sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output
```

for hardware targets, builds bootable image `${DEFCONFIG}_output/images/sdcard.img`.

## emulation
build `$DEFCONFIG=qemu` and install `qemu-system-arm`.

```sh
./emu.sh qemu_output/images/rootfs.ext2
```

## configuring, development
requries `libncurses-dev`.

### buildroot
```sh
. env.sh
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output menuconfig
...  # change some parameters, save
make --directory=$(pwd)/buildroot O=$(pwd)/${DEFCONFIG}_output # rebuild
make savedefconfig # save those changes, updates corresponding configs `accessilbility-oscilloscope/config/`.
```

### kernel
TODO

### multi-board development
just change the $DEFCONFIG to the current board being developed.
