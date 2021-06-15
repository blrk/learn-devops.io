# Install ubuntu Server (as VM in KVM)
* Ubuntu 18.04.5 LTS Server
* [Download from this link](https://releases.ubuntu.com/18.04/ubuntu-18.04.5-live-server-amd64.iso)
* During installation enable ssh option and create one user
* After successful installation, login into the VM and get the ip addessing using "ip a" command
* Check the connectivity to the VM from the command line of your laptop
``` bash
blrk@lpc:~> ping -c 4  192.168.122.83
PING 192.168.122.83 (192.168.122.83) 56(84) bytes of data.
64 bytes from 192.168.122.83: icmp_seq=1 ttl=64 time=0.385 ms
64 bytes from 192.168.122.83: icmp_seq=2 ttl=64 time=0.305 ms
64 bytes from 192.168.122.83: icmp_seq=3 ttl=64 time=0.335 ms
64 bytes from 192.168.122.83: icmp_seq=4 ttl=64 time=0.402 ms

--- 192.168.122.83 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3051ms
rtt min/avg/max/mdev = 0.305/0.356/0.402/0.045 ms
'''
* Login into to the VM using ssh
``` bash
blrk@lpc:~> ssh blrk@192.168.122.83
The authenticity of host '192.168.122.83 (192.168.122.83)' can't be established.
ECDSA key fingerprint is SHA256:k9kN23MiIp70y5hmZU5cjD+mqI4tMaejqykOWk9ux2E.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.122.83' (ECDSA) to the list of known hosts.
blrk@192.168.122.83's password: 
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-144-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 15 11:27:42 UTC 2021

  System load:  0.0                Processes:             103
  Usage of /:   30.6% of 18.57GB   Users logged in:       1
  Memory usage: 3%                 IP address for enp1s0: 192.168.122.83
  Swap usage:   0%


68 packages can be updated.
1 update is a security update.

New release '20.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Tue Jun 15 11:18:50 2021
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

blrk@cloud_app:~$ 
```


