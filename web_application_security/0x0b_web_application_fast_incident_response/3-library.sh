#!/bin/bash
grep "^54.145.34.34" logs.txt | awk -F\" '{print $6}' | sort | uniq -c | sort -nr | head -1 | awk '{print$2}'

