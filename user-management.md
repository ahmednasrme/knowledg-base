# Linux User Management

User management operation needs to be done by root user or super user.

## Create User

```bash
adduser [username]
```
You get a new username applying system default configuration, to list\change this configuration use option `-D`
```bash
adduser -D
#list default configuration
adduser -D --expiredate=2020-12-22
#change Default EXPIRE date to Dec 22 2020
#alternativly you can edit defaults in file /etc/default/useradd
```
* To set password upon creation use option `-p`
* User by default is added on usergroup 'named after him', to prevent this use option `-N`
* To add user into primary group use option `-g`
* To add user into secondary group(s) use option `-G`
* Read more `adduser -h`

## Delete User

```bash
userdel [username]
#delete user
userdel -r [username]
#delete user with home directory and mail spool
```

## Add/Remove User Into Group

To list groups assigned to user use command `groups`
```bash
groups [username]
```
To add existing user to group, use `usermod` command
```bash
usermod -g [group] [username]
#adding user to group as new primary
usermod -G [new,list,of,groups] [username]
#new list of supplementary groups
usermod -a [more,groups] [username]
#appending user to supplementary groups
```
To remove user from group, use `gpasswd`
```bash
gpasswd -d [username] [group]
```
Some distros (like ubuntu) uses `adduser` to add existing user to an existing group, `deluser` to remove user from group and `addgroup` to create new user group.
```bash
adduser [username] [group]
deluser [username] [group]
```

## Delete User Group

Using `groupdel`
```bash
groupdel [group]
#delete group
```
you may force it with `-f` option so it will be deleted even if its primary of a user

## Change Passwords

```bash
passwd [username]
#change password of specific user
passwd
#change my password
```

## Password Expiration and Aging

To list user account aging info use `-l` option with `chage`
```bash
chage -l [username]
```
for more about it use `chage --help`

## File permissions and ownership

Linux grants ownership by default to the creator, this can be changed by command `chown` as the following:
```bash
chown [option] [owner] [: [group]] FILE(s)
#change the owner and/or group of each FILE to OWNER and/or GROUP.
chown [OPTION]... --reference=RFILE FILE(s)
#change the owner and group of each FILE to those of RFILE.
```

Command `chmod` to modify permissions, that can be noted with symbols: [rwx] or octals [0-7]. Permissions are given associated with:
* User (file owner User)
* Group (file owner Group)
* Others
so you set different set of permissions for each, example:
```shell
chmod u=rwx,g=rx,o=r myfile
# file owner user can read,write and execute myfile
# file owner group members can read and execute
# others can only read
```
The following is equivalent using octal notaion:
```shell
chmod 754 myfile
```
Where each digit is assigning permissions for user,group and others, each digit is sum of permissions supposed to be assigned where:
* Read = 4
* Write = 2
* Execute = 1
* No permission = 0
There for:
- rwx = 4 + 2 + 1 = 7
- rx = 4 + 1 = 5

[more about chmod](https://www.computerhope.com/unix/uchmod.htm)

to view files with owners and permissions use option `-l` with `ls` command.