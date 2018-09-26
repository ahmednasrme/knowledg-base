# Linux Utilities

## Get a list of Open Ports in Linux

```bash
netstat -lntu
```

-l = only services which are listening on some port
-n = show port number, don't try to resolve the service name
-t = tcp ports
-u = udp ports

## List Printer Names

```bash
lpstat -p -d
```

## Extract Compressed Files

```bash
tar xvzf file.tar.gz
```

Where,
x: This option tells tar to extract the files.
v: The “v” stands for “verbose.” This option will list all of the files one by one in the archive.
z: The z option is very important and tells the tar command to uncompress the file (gzip).
f: This options tells tar that you are going to give it a file name to work with.
[from](https://www.interserver.net/tips/kb/extract-tar-gz-files-using-linux-command-line/)