# Open/Close Ports
Now if you need to control ports so you can run several apps on different ports, you got to keep in mind that listening to this port from your VHost isn't enough. You should open that port from the firewall.
Firewall software that is included in CentOS7 is *firewalld*, and here we got the main commands to get the job done.
## Check Status
```bash
sudo systemctl status firewalld
```
## Start Service
```bash
sudo systemctl start firewalld
```
## List All
To list all configuration already running:
```bash
sudo firewall-cmd --list-all
```
## List Open Ports
```bash
sudo firewall-cmd --list-ports
```
## List Services Allowed
```bash
sudo firewall-cmd --list-services
```
## Open a Port
```bash
sudo firewall-cmd --zone=public --add-port=81/tcp --permanent
sudo firewall-cmd --reload
```
Without "--permanent" flag, port 81 will be closed agian on reboot.
## Close a Port
Similarly we can reverse the last one this way:
```bash
firewall-cmd --remove-port=81/tcp --permanent
```
### more:
1. [How to open a port in the firewall on CentOS or RHEL](http://ask.xmodulo.com/open-port-firewall-centos-rhel.html)
2. [How to List Open Ports in Firewalld](https://linuxhint.com/list_open_ports_firewalld/)
3. [How to get started with Firewalld](https://www.certdepot.net/rhel7-get-started-firewalld/)