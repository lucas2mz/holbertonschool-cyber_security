#!/bin/bash
sudo nmap -open --packet-trace -reason -p 440-450 -sX $1