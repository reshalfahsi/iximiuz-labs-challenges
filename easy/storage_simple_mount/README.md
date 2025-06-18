# **Linux Storage: Mount a Drive and Read Its Contents**

You have access to a Linux system with an additional unmounted drive that contains a hidden flag. Your mission is to:

1. **Discover** the unmounted drive
2. **Mount** it to the filesystem
3. **Capture** the flag from the mounted drive

> **Hint #1: Discovering Block Devices**
>
> Before you can mount a drive, you need to know what drives are available on the system. Use commands like ``lsblk``, ``fdisk -l``, or ``blkid`` to list available block devices.
>
> Look for devices that aren't currently mounted (no mount point shown).

> **Hint #2: Creating Mount Points**
>
> To mount a filesystem, you need a **mount point** - an empty directory where the filesystem will be attached.
>
> Create a directory (commonly under ``/mnt/`` or ``/media/``) using ``mkdir`` before mounting.

> **Hint #3: The Mount Command**
>
> The basic syntax for mounting is:
```bash
mount /dev/<device> /path/to/mountpoint
```
> For example: ``mount /dev/sdb /mnt/my-drive``
>
> After mounting, you can access the files in the mounted filesystem through the mount point directory.

> **Hint #4: Finding the Flag**
>
> Once the drive is mounted, explore the mounted directory to find the flag file. Use ``ls`` to list files and ``cat`` to read file contents.
>
> The flag will be a hexadecimal string (containing only letters ``a-f`` and numbers ``0-9``).

## **Source**

[Linux Storage: Mount a Drive and Read Its Contents](https://labs.iximiuz.com/challenges/storage-simple-mount)

## **[Back to Home](../../)**