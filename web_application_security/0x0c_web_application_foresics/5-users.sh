#!/bin/bash
grep -Ei "useradd|adduser" auth.log | grep -Eo "name=[A-Za-z0-9_-]+" | cut -d= -f2 | sort -u | paste -sd,