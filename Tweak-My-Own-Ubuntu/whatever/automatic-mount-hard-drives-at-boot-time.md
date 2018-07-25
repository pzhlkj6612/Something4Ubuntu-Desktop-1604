## Whatever

### Automatic mount hard drives at boot time

#### Instruction

Browse your hard disks,

```shell
sudo lshw -short -class disk
```

```
H/W path         Device      Class          Description
=======================================================
/0/63/0.0.0      /dev/sda    disk           128GB TS128GSSD370S
/0/64/0.0.0      /dev/sdb    disk           500GB WDC WD5000AAKX-0
/0/65/0.0.0      /dev/sdc    disk           500GB ST3500414CS
/0/66/0.0.0      /dev/sdd    disk           160GB WDC WD1600BEVS-0
```

Browse the partitions in specific hard disk,

```shell
lsblk /dev/sdc /dev/sdd
```

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sdc      8:32   0 465.8G  0 disk
└─sdc1   8:33   0 465.8G  0 part
sdd      8:48   0 149.1G  0 disk
└─sdd1   8:49   0 149.1G  0 part
```

```/dev/sdxX``` are the disk partitions which exist in my system.

I want to mount ```/dev/sdc1``` to ```/mnt/sdc1``` folder, mount ```/dev/sdd1``` to ```/mnt/sdd1``` folder, so,

```shell
sudo mkdir /mnt/sdc1 /mnt/sdd1
```

Then, look up these partitions' information, it will be used later,

```shell
sudo blkid /dev/sdc1 /dev/sdd1
```

```
/dev/sdc1: UUID="8da8924d-aca0-45f0-b016-927af9b9a01a" TYPE="ext4" PARTUUID="0000ffff-01"
/dev/sdd1: UUID="054fe321-322d-4aa1-ab98-31cda7aeeedf" TYPE="ext4" PARTUUID="ffff0000-01"
```

We need ```UUID``` and ```TYPE```.

Let's modfiy ```/etc/fstab```! Do backing up first,

```shell
sudo cp /etc/fstab /etc/fstab_$(date -Iseconds) && ls -l /etc/fstab*
```

```
-rw-r--r-- 1 root root 745 Jul 23 23:15 /etc/fstab
-rw-r--r-- 1 root root 745 Jul 24 18:14 /etc/fstab_2018-07-24T18:14:52+08:00
```

```shell
sudo vi /etc/fstab
```

```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system>                              <mount point> <type> <options>         <dump>  <pass>
/dev/mapper/ubuntu--vg-root                  /             ext4   errors=remount-ro 0       1
# /boot was on /dev/sda1 during installation
UUID=d7cfc213-c593-4465-9862-0ea0ba06d34f    /boot         ext2   defaults          0       2
/dev/mapper/ubuntu--vg-swap_1                none          swap   sw                0       0
```

Add following contents,

```
/dev/sdc1 /mnt/sdc1 ext4 defaults 0 2
/dev/sdd1 /mnt/sdd1 ext4 defaults 0 2
```

or,

```
UUID=8da8924d-aca0-45f0-b016-927af9b9a01a /mnt/sdc1 ext4 defaults 0 2
UUID="054fe321-322d-4aa1-ab98-31cda7aeeedf" /mnt/sdd1 ext4 defaults 0 2
```

Save it, reboot your system, type,

```shell
df -h
```

```
Filesystem                   Size  Used Avail Use% Mounted on
...                          ...   ...  ...   ...  ...
/dev/sdd1                    147G   60M  140G   1% /mnt/sdd1
/dev/sdc1                    459G   70M  435G   1% /mnt/sdc1
```

<br/>

**DO NOT** modify ```fstab``` through ssh unless you know what you are doing.

<br/>

#### Additional but useful operations

Remember, It's **NECESSARY** to use the following command to validate your modified ```fstab```, unless you want to recover your system at next boot time.

```shell
sudo mount -a
```

No information will be returned when everything goes correct.

If ```<mount point>``` invalid,

```
mount: mount point /media/sdb1 does not exist
```

```<type>``` invalid,

```
mount: unknown filesystem type 'exr3'
```

```<file system>``` invalid,

```
mount: special device /dev/sdb1 does not exist
```

or,

```
mount: /home is not a block device
```

PS: ```<options>```, ```<dump>``` and ```<pass>``` will not be checked probably.

<br/>

#### Fix boot failure due to incorrect fstab

When you boot your system,

```
...
[  OK  ] Started File System Check on /dev/disk/by-uuid/550e8400-e29b-41d4-a716-446655440000. 
         Mounting /boot...
[  OK  ] Mounted /boot.
[ ***  ] A start job is running for dev-xxx.device (1min 23s / 1min 30s)
```

Then,

```
...
[ TIME ] Timed out waiting for device dev.device.
[DEPEND] Dependency failed for /home.
[DEPEND] Dependency failed for Local File Systems.
[DEPEND] Dependency failed for File System Check on /dev.
...
Welcome to emergency mode! After logging in, type "journalctl -xb" to view
system logs, "systemctl reboot" to reboot, "systemctl default" or ^D to
try again to boot into default mode.
Press Enter for maintenance
(or press Control-D to continue):
```

Press "Enter", you will log in system as root user.

Just modify your ```fstab``` file, save it, and run ```mount -a``` to do checking, reboot your system.

<br/>

Ref:

- [unity - How to automatically mount 2nd internal Hard Drive - Ask Ubuntu](https://askubuntu.com/questions/769974/how-to-automatically-mount-2nd-internal-hard-drive)
- [automount - How to make partitions mount at startup? - Ask Ubuntu](https://askubuntu.com/questions/164926/how-to-make-partitions-mount-at-startup)
- [A complete fstab guide - Linux Stall](http://www.linuxstall.com/fstab/)
- [Fstab - Community Help Wiki](https://help.ubuntu.com/community/Fstab)
- [How to get hard disk information on linux terminal? - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/273971/how-to-get-hard-disk-information-on-linux-terminal)
- [how to list all hard disks in linux from command line &#8211; lost saloon](http://www.lostsaloon.com/technology/how-to-list-disks-in-linux/)
- [linux - Differences between /dev/sda and /dev/sda1 - Server Fault](https://serverfault.com/questions/338937/differences-between-dev-sda-and-dev-sda1)
- [blkid(8) - Linux man page](https://linux.die.net/man/8/blkid)
- [24.4.2. Using the blkid Command - Red Hat Customer Portal](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s2-sysinfo-filesystems-blkid)

<br/>

- [fedora - How do you validate fstab without rebooting? - Server Fault](https://serverfault.com/questions/174181/how-do-you-validate-fstab-without-rebooting)

<br/>

- [\[ubuntu\] fstab typo - recovery advice needed](https://ubuntuforums.org/showthread.php?t=1571596)
- [How to Fix &quot;failed to mount /etc/fstab&quot; Error in Linux](https://www.tecmint.com/fix-failed-to-mount-etc-fstab-error-in-linux/)

Ref++:

- [Ubuntu: Mount The Drive From Command Line - nixCraft](https://www.cyberciti.biz/faq/mount-drive-from-command-line-ubuntu-linux/)
- [Mount - Community Help Wiki](https://help.ubuntu.com/community/Mount)

<br/>

- [rhel - How to fix boot failure due to incorrect fstab? - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/44027/how-to-fix-boot-failure-due-to-incorrect-fstab)
- [Edit &quot;read-only&quot; /etc/fstab from &quot;System Recovery#&quot;  (without boot cd?)](https://www.linuxquestions.org/questions/linux-general-1/edit-read-only-etc-fstab-from-system-recovery-without-boot-cd-515239/)

Ref#:

- [boot - Repairing the FSTAB - Ask Ubuntu](https://askubuntu.com/questions/83172/repairing-the-fstab)
- [boot - Accidentally deleted /etc/fstab file - Ask Ubuntu](https://askubuntu.com/questions/435965/accidentally-deleted-etc-fstab-file)
- [Destroyed fstab file by mistake! Need to restore it - Ask Ubuntu](https://askubuntu.com/questions/516442/destroyed-fstab-file-by-mistake-need-to-restore-it)
- [boot - How to restore fstab file - Ask Ubuntu](https://askubuntu.com/questions/814811/how-to-restore-fstab-file)
- [10.04 - How to rebuild fstab automatically - Ask Ubuntu](https://askubuntu.com/questions/81726/how-to-rebuild-fstab-automatically)

<br/>

- [boot - A start job is running for dev-disk-by x2duuid-ad0b043b\\x2d404c... .device (7s / 1min 30s) - Ask Ubuntu](https://askubuntu.com/questions/956042/a-start-job-is-running-for-dev-disk-by-x2duuid-ad0b043b-x2d404c-device-7s)
- [boot - What is dev-sda.device in systemd-analyze, can i disable it? - Ask Ubuntu](https://askubuntu.com/questions/948748/what-is-dev-sda-device-in-systemd-analyze-can-i-disable-it)
