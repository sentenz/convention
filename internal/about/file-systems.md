# File Systems // TODO

A file system is a structure of directories that is used to organize and store files. A file system is the method an operating system uses to name files and assign them locations for efficient storage and retrieval.

- [1. Flash Driver](#1-flash-driver)
  - [1.1. JFFS2](#11-jffs2)
- [2. Linux](#2-linux)
  - [2.1. ext3](#21-ext3)
  - [2.2. extfs](#22-extfs)
  - [2.3. overlay2](#23-overlay2)
  - [2.4. btrfs](#24-btrfs)
  - [2.5. zfs](#25-zfs)
- [3. Microsoft](#3-microsoft)
  - [3.1. FAT32](#31-fat32)
  - [3.2. NTFS](#32-ntfs)
- [4. macOS](#4-macos)
  - [4.1. APFS](#41-apfs)
- [5. Swap Space](#5-swap-space)
- [6. See also](#6-see-also)

## 1. Flash Driver

The special properties of data carriers based on flash memory mean that there are some file systems that take special account of these properties.

### 1.1. JFFS2

JFFS2 (Journaling Flash File System, version 2): further developed variant of JFFS, support for NAND flash, compression, etc.; contrary to the name, it does not use journaling.

## 2. Linux

### 2.1. ext3

ext3 (Third Extended File System) file system developed with the Linux kernel. ext3 is an advanced variant of ext2 with journaling.

### 2.2. extfs

### 2.3. overlay2

### 2.4. btrfs

### 2.5. zfs

## 3. Microsoft

### 3.1. FAT32

FAT32 (File Allocation Table) newer variant of the FAT file system family with extended limits compared to FAT16, from Windows 95b or Windows 2000.

### 3.2. NTFS

NTFS (New Technology File System) with journaling file system of the Windows NT product line.

## 4. macOS

### 4.1. APFS

## 5. Swap Space

The primary function of swap space is to substitute disk space for RAM memory when real RAM fills up and more space is needed. Swap space is used for virtual memory storage areas when the system does not have enough physical memory to handle current processes.

## 6. See also

- Oracle [file systems](https://docs.oracle.com/cd/E18752_01/html/817-5093/fsoverview-51.html) article.
