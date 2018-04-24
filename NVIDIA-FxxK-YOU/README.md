**Uncompleted**

<br/>

# Install Ubuntu on nVIDIA Notebook

![](./NVIDIA-FUCK-YOU.jpg?raw=true)

<br/>

## Things you should know first

#### Access the Grub Menu

Try pressing "Left Shift", "Right Shift", "Esc" or "Spacebar" key continually to access Grub Menu after POST.

<br/>

Ref:

- [\[ubuntu\] Unable to access the Grub Menu (so that I revert back to my original kernel)](https://ubuntuforums.org/showthread.php?t=2361442#post_13645818)

> If your system is UEFI, [advice on the forums](https://ubuntuforums.org/showthread.php?t=2345616#post13579808) says the **ESC key** might be used instead of **Shift** to display the grub menu.

- [\[ubuntu\] How do let UEFI access Grub menu?](https://ubuntuforums.org/showthread.php?t=2345616#post13579808)

> If your install only sees one system, grub is not normally shown, it assumes you just want to boot default as that is only choice.    
> If UEFI and booting in UEFI mode you press **escape key** (perhaps more than once) just after UEFI screen but before grub menu. If UEFI has fast boot on, you may not have time to press a key.    
> If BIOS boot you press and hold **shift key** from BIOS until grub menu appears.

- [grub2 - How to get to the GRUB menu at boot-time? - Ask Ubuntu](https://askubuntu.com/questions/16042/how-to-get-to-the-grub-menu-at-boot-time#answer-16048)

> I've heard **Shift** does it. But I've used **Space** before and it worked.

- [\[SOLVED\] Can't access grub boot menu with shift key (or anything else)](https://ubuntuforums.org/showthread.php?t=1939408#post_11757915)
- [How to access the grub boot menu before it tries to load the operating system - Quora](https://www.quora.com/How-do-I-access-the-grub-boot-menu-before-it-tries-to-load-the-operating-system)
- [How to Display Grub Menu at Boot Time in Ubuntu](http://www.pontikis.net/tip/?id=36)
- [grub2 - Warning: Setting GRUB_TIMEOUT to a non-zero value when GRUB_HIDDEN_TIMEOUT is set is no longer supported - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/400803/warning-setting-grub-timeout-to-a-non-zero-value-when-grub-hidden-timeout-is-se)
- [\[SOLVED\] how to get to grub menu during boot?](https://ubuntuforums.org/showthread.php?t=1520821)
- [\[SOLVED\] GRUB Menu not showing after Ubuntu Installation](https://ubuntuforums.org/showthread.php?t=2380145)

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

PS: These are temporary settings so all your changes will be recovered before next boot.

PPS: DO NOT modify ```/etc/default/grub``` to apply "nomodeset" permanently if you have the plan to install nVIDIA driver.

<br/>

If you don't want to experience the [Stuck in Login Loop](#stuck-in-login-loop), this is the best chance to install the driver for your nVIDIA standalone graphics card, see below.

<br/>

Ref:

- [5 Keys You Can Press at the GRUB Menu - OMG! Ubuntu!](https://www.omgubuntu.co.uk/2016/07/key-to-show-grub-menu-ubuntu)
- [ubuntu nomodeset设定 - CSDN博客](https://blog.csdn.net/CaptainHailong/article/details/79765579)
- [graphics - How do I set &#39;nomodeset&#39; after I&#39;ve already installed Ubuntu? - Ask Ubuntu](https://askubuntu.com/questions/38780/how-do-i-set-nomodeset-after-ive-already-installed-ubuntu)
- [boot - What do the nomodeset, quiet and splash kernel parameters mean? - Ask Ubuntu](https://askubuntu.com/questions/716957/what-do-the-nomodeset-quiet-and-splash-kernel-parameters-mean)

<br/>

## Stuck in Login Loop [Uncompleted]

;

*Waiting for test results*

Ref:

- [Ubuntu 16 Stuck in Login Loop after Installing Nvidia 364 Drivers - Ask Ubuntu](https://askubuntu.com/questions/762831/ubuntu-16-stuck-in-login-loop-after-installing-nvidia-364-drivers)
- []()
- []()
- []()
- [ubuntu16.04 笔记本 安装双显卡驱动GTX960M  可快捷切换 - CSDN博客](https://blog.csdn.net/feishicheng/article/details/70662094)
- [Ubuntu 14.04 卡在Logo中无法进入系统解决方案 - CSDN博客](https://blog.csdn.net/github_33934628/article/details/52422855)
- [安装Ubuntu 16.04时卡住的那些坑 - CSDN博客](https://blog.csdn.net/Dod_Jdi/article/details/78635126)

<br/>
