#!/bin/bash
whois "$1" | awk '/^(Registrant|Admin|Tech)/ {gsub(/^ +/,""); sub(": ",","); print}' > "$1.csv"