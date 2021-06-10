#!/bin/bash
arch=$(uname -a)
pcpu=$(lscpu | grep 'CPU(s):' | awk 'NR == 1 {print $2}')
vcpu=$(nproc)
ramuse=$(free | grep 'LVMGroup-root' | awk 'NR == 1 {prinf"%d/%.1fG (%d%%)", $3, $2, $5}')
cpuld=$(mpstat | aek '{printf"%s %s", $3, $4}')
lvm=$(lsblk | grep 'lvm' | wc -l)
tcp=$(netstat -t | wc -l)
usrlog=$(who | wc -l)
ip=$(ifconfig | grep 'inet' | awk 'NR == 1 {print $2}')
mac=$(ifconfig | grep 'ether' | awk 'NR == 1 {print $2}')
usudo=$(cat /var/log/sudo/sudo_log | grep 'COMMAND' | wc -l)

if (("$lvm));
then tmp="yes"
else tmp="no"
fi

wall "
#Architecture: $arch
#CPU physical : $pcpu
#vCPU : $vcpu
#Memory Usage: $ramuse
#Disk Usage: $romuse
#CPU load: $cpuld
#Last boot: $lstld
#LVM use: $tmp
#Connexions TCP : $tcp ESTABLISHED
#User log: $usrlog
#Network: IP $ip ($mac)
#Sudo : $usudo cmd
"