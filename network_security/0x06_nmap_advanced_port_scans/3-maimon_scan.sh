#!/bin/bash
sudo nmap -p ftp,ssh,telnet,http,https -vv -sM $1