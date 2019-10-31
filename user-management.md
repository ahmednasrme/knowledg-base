# Linux User Management

## Create User

```bash
adduser [username]
```
You get a new username applying system default configuration, to list\change this configuration use option `-D`
```bash
adduser -D
#list default configuration
adduser -D --expiredate=2020-12-22
#change Default EXPIRE date to Dec 12 2020
#alternativly you can edit defaults in file /etc/default/useradd
```
* To set password upon creation use option `-p`
* User by default is added on usergroup 'named after him', to prevent this use option `-N`
* To add user into primary group use option `-g`
* To add user into secondary group(s) use option `-G`
* Read more `adduser -h`

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
Some distros (like ubuntu) uses `deluser`
```bash
deluser [username] [group]
```
## Change Passwords
```bash
passwd [username]
```
## Password Expiration and Aging
```bash
chage
```