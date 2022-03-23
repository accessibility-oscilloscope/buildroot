# buildroot

get the buildroot submodule,

```sh
$ git submodule update --init
```

built using buildroot LTS tag 2021.02.6.

## supported boards

- rpi4 (primary)
- rpi3 (secondary)
- qemu

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
set `DEFCONFIG` to one of the [supported boards](#supported-boards),

```sh
$ export DEFCONFIG=rpi4
```

for example.  first, configure

```sh
$ ./build.sh ${DEFCONFIG}_defconfig
```

see [configuring](#configuring) if you'd like to audit the configuration.
then build,

```sh
$ ./build.sh
```

for hardware targets, this builds bootable image `${DEFCONFIG}_output/images/sdcard.img`.

## emulation
build with `DEFCONFIG=qemu` and install `qemu-system-arm`.

```sh
$ ./emu.sh qemu_output/
```

## configuring
requries `libncurses-dev`.

### buildroot
```sh
$ ./build.sh menuconfig
...  # change some parameters, save
$ ./bulid.sh # rebuild, test things
$ ./build.sh savedefconfig # save those changes, updates corresponding configs `accessilbility-oscilloscope/config/`.
```

### kernel
```sh
$ ./build.sh linux-menuconfig
$ ./build.sh linux-savedefconfig
$ ./build.sh linux-update-defconfig
```

### multi-board development
just change the $DEFCONFIG to the current board being developed.
