## Whatever

### Fix broken autocomplete of ```apt-get```'s package name

Attention! It only works for me.

<br/>

```shell
sudo apt install bash-completion
```

Then, append following contents to ```~/.bashrc``` or ```/etc/bash.bashrc```,

```shell
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
```

<br/>

Ref:

- [Debian - apt (not apt-get) autocompletion not working - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/312456/debian-apt-not-apt-get-autocompletion-not-working)
- [bash - apt-get autocomplete package name is broken - Ask Ubuntu](https://askubuntu.com/questions/86375/apt-get-autocomplete-package-name-is-broken)
