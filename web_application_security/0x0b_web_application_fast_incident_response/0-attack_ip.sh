#!/bin/bash

cat logs.txt | awk '{print $1}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}' 
