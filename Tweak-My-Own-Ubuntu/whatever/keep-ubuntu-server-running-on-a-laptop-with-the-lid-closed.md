# Whatever

### Keep Ubuntu Server running on a laptop with the lid closed

```shell
sudo vi /etc/systemd/logind.conf
```

```
:%s/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/
:wq
```

Then, restart the service,

```shell
sudo systemctl restart systemd-logind.service
```

<br/>

Ref:

- [power management - Keep Ubuntu Server running on a laptop with the lid closed? - Ask Ubuntu](https://askubuntu.com/questions/141866/keep-ubuntu-server-running-on-a-laptop-with-the-lid-closed)
