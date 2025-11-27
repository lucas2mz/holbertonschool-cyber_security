#!/bin/bash

cat logs.txt | awk '{print $7}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
