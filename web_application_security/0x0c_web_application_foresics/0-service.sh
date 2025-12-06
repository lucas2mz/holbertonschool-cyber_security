#!/bin/bash
grep -RiE "ssh|sshd" /var/log/
echo "sshd"