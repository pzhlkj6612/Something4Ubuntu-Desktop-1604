**Uncompleted**

<br/>

# Tweak My Own Ubuntu

![](./20180512_Ubuntu1804_Hue-add-210_00000_1.png?raw=true)

<br/>

## Server

### Things that we have to do first

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install -y vim
```

<br/>

### Set a static IP and DNS servers - Not 17.10, 18.04 and newer

1. Which interface do I use for my static IP?



2. Configure the network interface

```shell
sudo vi /etc/network/interfaces
```

```shell
# This file describes the network interfaces available in your system
# and how to activate then. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enp2s0
iface enp2s0 inet dhcp
```

Ref:
- [Network configuration on Ubuntu 12.04 - 17.04 \(incl. Ubuntu 16.04 LTS\) # Linux Basics - Set a Static IP on Ubuntu](https://www.howtoforge.com/linux-basics-set-a-static-ip-on-ubuntu#ubuntu-incl-ubuntu-lts)
- [gather-info # How to set a static IP in Ubuntu - Ubuntu Network Configuration](http://www.sudo-juice.com/how-to-set-a-static-ip-in-ubuntu-network-confirguration/#gather-info)
- [networking - Network interface name changes after update to 15.10 - udev changes - Ask Ubuntu](https://askubuntu.com/questions/689070/network-interface-name-changes-after-update-to-15-10-udev-changes)

Ref*:
- [Network Configuration](https://help.ubuntu.com/lts/serverguide/network-configuration.html)

<br/>

### Get wireless network

1. Install ```wpasupplicant``` and ```wireless-tools```

```shell
sudo apt install -y wpasupplicant wireless-tools
```

2. Find your netword device

```shell
sudo iwconfig
```

```shell
wlp3s0    IEEE 802.11bgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=20 dBm
          Retry short limit:7   RTS thr=2347 B   Fragment thr:off
          Encryption key:off
          Power Management:on

enp2s0    no wireless extensions.

lo        no wireless extensions.

```

```wlp3s0``` is my wlan interface.

3. Bring the interface up

```shell
sudo ifconfig wlp3s0 up
```

4. Scan the world

```shell
sudo iwlist wlp3s0 scan | less
```

```shell
wlp3s0  Scan completed :
        Cell 01 - Address: FF:FF:FF:FF:FF:FF
                  Channel:1
                  Frequency:2.412 GHz (Channel 1)
                  Quality=70/70  Signal level=-8 dBm
                  Encryption key:on
                  ESSID:"NB"
                  Bit Rates:1 Mb/s; 2 Mb/s; 5.5 Mb/s; 11 Mb/s; 9 Mb/s
                            18 Mb/s; 36 Mb/s; 54 Mb/s
                  Bit Rates:6 Mb/s; 12 Mb/s; 24 Mb/s; 48 Mb/s
                  Mode:Master
                  ...
        Cell 02 - Address: ...
        
```

```NB``` is the SSID of my router.

<br/>

Ref:

- [Get wireless working under Ubuntu Server 16.04](https://ubuntuforums.org/showthread.php?t=2325768)
- [Linux WPA Supplicant \(IEEE 802.1X, WPA, WPA2, RSN, IEEE 802.11i\)](https://w1.fi/wpa_supplicant/)
- [SSID、BSSID、ESSID区别？ - 知乎](https://www.zhihu.com/question/24362037)

<br/>

## Desktop

### Find wallpapers

### Fix time differences between ubuntu and windows dual boot
