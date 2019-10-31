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

To list user groups use command `groups`
```bash
groups [username]
```
To add existing user to group
## Change Passwords

```bash
passwd [username]
```
## Password Expiration and Aging
```bash
chage
```