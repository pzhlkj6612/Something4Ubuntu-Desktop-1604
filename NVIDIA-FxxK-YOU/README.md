**Uncompleted**

<br/>

# Install Ubuntu on nVIDIA Notebook

![](./NVIDIA-FUCK-YOU.jpg?raw=true)

<br/>

## Things you should know first

#### Access the Grub Menu

> If your system is UEFI, [advice on the forums](https://ubuntuforums.org/showthread.php?t=2345616#post13579808) says the **ESC key** might be used instead of **Shift** to display the grub menu.

[\[ubuntu\] Unable to access the Grub Menu (so that I revert back to my original kernel)](https://ubuntuforums.org/showthread.php?t=2361442#post_13645818)

> - If your install only sees one system, grub is not normally shown, it assumes you just want to boot default as that is only choice.    
> - If UEFI and booting in UEFI mode you press **escape key** (perhaps more than once) just after UEFI screen but before grub menu. If UEFI has fast boot on, you may not have time to press a key.    
> - If BIOS boot you press and hold **shift key** from BIOS until grub menu appears.

[\[ubuntu\] How do let UEFI access Grub menu?](https://ubuntuforums.org/showthread.php?t=2345616#post13579808)

> I've heard Shift does it. But I've used Space before and it worked.

[grub2 - How to get to the GRUB menu at boot-time? - Ask Ubuntu](https://askubuntu.com/questions/16042/how-to-get-to-the-grub-menu-at-boot-time#answer-16048)

<br/>

## Stuck in Ubuntu Logo after installation

- Reboot
- [Enter Grub Menu](#access-the-grub-menu) after POST
- Use the Up and Down arrow keys to select ```Ubuntu``` and press 'e' key
- Find ```linux``` line and add "nomodeset" near "quiet splash" with spaces:

old,
```
    linux    /boot/...xxxx ro  quiet splash $vt_handoff
```
new,
```
    linux    /boot/...xxxx ro  quiet splash nomodeset $vt_handoff
```
or,
```
    linux    /boot/...xxxx ro  nomodeset quiet splash $vt_handoff
```
- Press "Ctrl-X" or "F10" to apply the modification and go for boot
- Now, you can see a normal booting process probably

If you don't want to experience the [Stuck in Login Loop](#stuck-in-login-loop), it's the best chance to install the driver for your nVIDIA standalone graphics card, see below.

<br/>

## Stuck in Login Loop 

;

<br/>
