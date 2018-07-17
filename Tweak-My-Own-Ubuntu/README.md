**Uncompleted**

<br/>

# Tweak My Own Ubuntu

![](./20180512_Ubuntu1804_Hue-add-210_00000_1.png?raw=true)

<br/>

## Server

### Things that we have to do

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install -y vim
```
<br/>

### Get wireless network

1. Install ```wpasupplicant``` and ```wireless-tools```

```shell
sudo apt install -y wpasupplicant wireless-tools
```

2. Find your netword device

```shell
sudo ifconfig -a
```
```shell
enp2s0  Link encap:...

lo      Link encap:...

wlp3s0  Link encap:...

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
- [networking - Network interface name changes after update to 15.10 - udev changes - Ask Ubuntu](https://askubuntu.com/questions/689070/network-interface-name-changes-after-update-to-15-10-udev-changes)
- [SSID、BSSID、ESSID区别？ - 知乎](https://www.zhihu.com/question/24362037)

<br/>

## Desktop

### Find wallpapers

### Fix time differences between ubuntu and windows dual boot
