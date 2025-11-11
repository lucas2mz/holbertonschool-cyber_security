#!/bin/bash
sudo nmap -reason -host-timeout 1000 -p $2 -sA $1