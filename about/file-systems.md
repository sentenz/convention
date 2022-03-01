# File Systems

A file system is a structure of directories that is used to organize and store files.

- [Flash Driver](#flash-driver)
  - [JFFS2](#jffs2)
- [Linux](#linux)
  - [ext3](#ext3)
- [Microsoft](#microsoft)
  - [FAT32](#fat32)
  - [NTFS](#ntfs)
- [Swap Space](#swap-space)
- [See also](#see-also)

## Flash Driver

The special properties of data carriers based on flash memory mean that there are some file systems that take special account of these properties.

### JFFS2

JFFS2 (Journaling Flash File System, version 2): further developed variant of JFFS, support for NAND flash, compression, etc.; contrary to the name, it does not use journaling.

## Linux

### ext3

ext3 (Third Extended File System) file system developed with the Linux kernel. ext3 is an advanced variant of ext2 with journaling.

## Microsoft

### FAT32

FAT32 (File Allocation Table) newer variant of the FAT file system family with extended limits compared to FAT16, from Windows 95b or Windows 2000.

### NTFS

NTFS (New Technology File System) with journaling file system of the Windows NT product line.

## Swap Space

The primary function of swap space is to substitute disk space for RAM memory when real RAM fills up and more space is needed. Swap space is used for virtual memory storage areas when the system does not have enough physical memory to handle current processes.

## See also

- Oracle [file systems](https://docs.oracle.com/cd/E18752_01/html/817-5093/fsoverview-51.html) article.
