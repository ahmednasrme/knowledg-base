# Shell Files
Listing here some shell files I used to solve some specific problems.
## routest
* [routeset](./routeset.sh)
### Problem
My workstation (running on ubuntu) used to have two connections to different networks (net1,net2), where I need to stay online via net2, I need also to access specific servers via net1 in the same time.
The ip is always assigned by dhcp on both networks.
### Solution
Keep net2 gateway as your default, then route all packets going to those servers on net1.