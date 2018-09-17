# Linux Utilities
### Get a list of Open Ports in Linux
```bash
$ netstat -lntu
```
-l = only services which are listening on some port
-n = show port number, don't try to resolve the service name
-t = tcp ports
-u = udp ports
### List Printer Names
```bash
$ lpstat -p -d
```
