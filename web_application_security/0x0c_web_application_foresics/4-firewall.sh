#!/bin/bash
grep -Ei "iptables -A" auth.log | wc -l