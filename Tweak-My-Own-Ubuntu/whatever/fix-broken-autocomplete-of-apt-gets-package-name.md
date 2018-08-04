## Whatever

### Fix broken autocomplete of ```apt-get```'s package name

Attention! It only works for me.

<br/>

```shell
sudo apt install bash-completion
```

Then, check to see if the file which is ```~/.bashrc``` contains following contents,

```shell
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
```

If not, append it directly.

Then,

```shell
. ~/.bashrc
```

<br/>

Ref:

- [Debian - apt (not apt-get) autocompletion not working - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/312456/debian-apt-not-apt-get-autocompletion-not-working)
- [bash - apt-get autocomplete package name is broken - Ask Ubuntu](https://askubuntu.com/questions/86375/apt-get-autocomplete-package-name-is-broken)
