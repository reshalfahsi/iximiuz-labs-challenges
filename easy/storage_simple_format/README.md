# **Linux Storage: Format a Drive with Ext4 Filesystem**

You have access to a Linux system with an additional empty, unformatted drive. Your mission is to:

1. **Discover** the empty drive
2. **Format** it with the ext4 filesystem
3. **Mount** it at ``/mnt/my-ext4-drive``
4. **Create** a test file to prove everything works

First, identify and format the empty drive with ext4.

> **Hint #1: Discovering Available Drives**
>
> You need to identify which drives are available on the system and which ones are unformatted. Commands like ``lsblk`` or ``fdisk -l`` can help you explore the storage devices.
>
> Look for drives without any filesystem information.

> **Hint #2: Formatting Commands**
>
> Linux provides several commands for formatting drives with different filesystems. For ext4, you'll want to use the ``mkfs`` family of commands.
>
> Research the appropriate command for creating ext4 filesystems.

Next, mount the formatted drive at the specified location.

> **Hint #3: Mount Points**
>
> Before mounting a filesystem, you need a directory to serve as the mount point. The challenge expects the filesystem to be mounted at ``/mnt/my-ext4-drive``.
>
> Don't forget to create this directory before attempting to mount.
> 
> If you've never mounted a drive before, [try solving our mount challenge](https://labs.iximiuz.com/challenges/storage-simple-mount) first.

Finally, create a test file hello.txt in the mounted drive and write something to it.

## **Source**

[Linux Storage: Format a Drive with Ext4 Filesystem](https://labs.iximiuz.com/challenges/storage-simple-format)

## **[Back to Home](../../)**