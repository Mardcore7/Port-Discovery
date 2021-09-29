#!/bin/bash

hosts=($@)

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: 192.168.1.20 192.168.1.21"
else
    for host in ${hosts[@]}; do
        echo -e "\n[+] Scanning ports on $host\n"
        for port in $(seq 0 65535); do
            timeout 1 bash -c "echo '' > /dev/tcp/$host/$port" 2> /dev/null && echo -e "\t[+] Port $port - OPEN"
        done; wait
    done
fi
