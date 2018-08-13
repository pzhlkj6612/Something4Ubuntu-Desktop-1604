## Whatever

### Global Proxy

#### HTTP proxy

Set ```http_proxy``` and ```https_proxy``` point to a HTTP proxy(use ```export```, notice case **in**sensitive).

<br/>

Additional:

- **Apt**itude

Create ```/etc/apt/apt.conf.d/wtfProxies```,

```ini
Acquire::http::proxy "http://balabala:balabala";
Acquire::https::proxy "https://balabala:balabala";
Acquire::ftp::proxy "ftp://balabala:balabala";
```

<br/>

Ref:

- [AptConf - Debian Wiki](https://wiki.debian.org/AptConf)
- [proxy - How do I configure proxies without GUI? - Ask Ubuntu](https://askubuntu.com/questions/175172/how-do-i-configure-proxies-without-gui)

<br/>

#### SOCKS proxy

HTTP/HTTPS through SOCKS4/SOCKS5 proxy by **Polipo**.

##### Polipo

edit ```/etc/polipo/config```,

```ini
# This file onlu needs to list configuration variables that deviate
# from the default vaules.  See /usr/share/doc/polipo/examples/config.sample
# and "polipo -v" for variables you can tweak and further information.

logSyslog = true
logFile = /var/log/polipo/polipo.log

proxyAddress = "polipo's address" # IPv4 only
proxyPort = 12345

socksParentProxy = "socksProxy's address:port"
socksProxyType = socks5
```

<br/>

Ref:

- [The Polipo Manual](https://www.irif.fr/~jch/software/polipo/polipo.html)
- [UbuntuServer配置\*\*代理 - 钇钛网](https://blog.yourtion.com/ubuntu-server-add-shadowsocks-proxy.html)
- [Ubuntu server命令行配置\*\*全局代理 - jingsam](https://jingsam.github.io/2016/05/08/setup-shadowsocks-http-proxy-on-ubuntu-server.html)
