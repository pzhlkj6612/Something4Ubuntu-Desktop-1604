## Whatever

### Get wireless network

1. Install ```wpasupplicant``` and ```wireless-tools```

```shell
sudo apt install -y wpasupplicant wireless-tools
```

2. Find your netword device

```shell
sudo iwconfig
```

```
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
sudo ifup wlp3s0
```

4. Scan the world

```shell
sudo iwlist wlp3s0 scan | less
```

```
wlp3s0    Scan completed :
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
          ...

```

```NB``` is the SSID of my router.

...

<br/>

Ref:

- [Get wireless working under Ubuntu Server 16.04](https://ubuntuforums.org/showthread.php?t=2325768)
- [Linux WPA Supplicant \(IEEE 802.1X, WPA, WPA2, RSN, IEEE 802.11i\)](https://w1.fi/wpa_supplicant/)
- [SSID、BSSID、ESSID区别？ - 知乎](https://www.zhihu.com/question/24362037)
