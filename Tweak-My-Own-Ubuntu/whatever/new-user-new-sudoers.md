## Whatever

### New user, new sudoers

New user,

```shell
adduser USERNAME
```

Append it to ```sudo``` group,

```shell
sudo usermod -aG sudo USERNAME
```

or,

```shell
sudo adduser USERNAME sudo
```

Check groups,

```shell
cat /etc/group
```

check uesrs,

```shell
cat /etc/passwd
```

or,

```shell
cat /etc/shadow
```

<br/>

Ref:

- [ubuntu下给用户添加sudo权限，并且如何取消sudo权限 - CSDN博客](https://blog.csdn.net/u011774239/article/details/48463393)
- [ubuntu查看所有用户/用户组 - CSDN博客](https://blog.csdn.net/dehailiu/article/details/10086725)
- [ubuntu列出所有的系统用户的命令是什么？_百度知道](https://zhidao.baidu.com/question/502647334.html)
- [what is difference between /etc/shadow and /etc/passwd - Ask Ubuntu](https://askubuntu.com/questions/445361/what-is-difference-between-etc-shadow-and-etc-passwd)
