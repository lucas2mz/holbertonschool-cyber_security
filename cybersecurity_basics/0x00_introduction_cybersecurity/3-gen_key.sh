#!/bin/bash
KEY_NAME="$1"
ssh-keygen -t rsa -b 4096 -f "$KEY_NAME" -N ""