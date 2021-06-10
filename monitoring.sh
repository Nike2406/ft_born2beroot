#!/bin/bash
arch=$(uname -a)
pcpu=$(lscpu | grep 'CPU(s):' | awk 'NR == 1 {print $2}')
vcpu