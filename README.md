# About

Call BIOS systemcall in x86 NASM Assembly.

# Environment

```bash
$ uname -a
Darwin MacBookAir-2.local 18.2.0 Darwin Kernel Version 18.2.0: Fri Oct  5 19:41:49 PDT 2018; root:xnu-4903.221.2~2/RELEASE_X86_64 x86_64
```

# Require

```bash
brew install nasm
brew install qemu
```

# Run

```bash
$ nasm -f bin print.nasm
$ ls
README.md print      print.nasm
$ qemu-system-x86_64 print
```

![](https://i.imgur.com/O0xgd4Q.png)

# Detail

## Magic number

The last two bytes in the boot sector is `0x55` and `0xaa`.

It must be put like below

```
db 0x55
db 0xaa
```

## Memory map

```bash
0x00000000 - 0x000003FF - Real Mode Interrupt Vector Table
0x00000400 - 0x000004FF - BIOS Data Area
0x00000500 - 0x00007BFF - Unused
0x00007C00 - 0x00007DFF - Our Bootloader
0x00007E00 - 0x0009FFFF - Unused
0x000A0000 - 0x000BFFFF - Video RAM (VRAM) Memory
0x000B0000 - 0x000B7777 - Monochrome Video Memory
0x000B8000 - 0x000BFFFF - Color Video Memory
0x000C0000 - 0x000C7FFF - Video ROM BIOS
0x000C8000 - 0x000EFFFF - BIOS Shadow Area
0x000F0000 - 0x000FFFFF - System BIOS
```

As you see above, text section start at 0x00007C00 in real mode of cpu.
