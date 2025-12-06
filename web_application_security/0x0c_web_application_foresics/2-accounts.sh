#!/bin/bash
grep -i "Accepted password" auth.log | awk '{print $9}' | sort -u | tail -n 1