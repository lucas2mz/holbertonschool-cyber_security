#!/bin/bash
john --format=RAW-MD5 --wordlist="/usr/share/wordlists/rockyou.txt" "$1"