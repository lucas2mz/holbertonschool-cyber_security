#!/bin/bash
KEY_NAME="$1"
if [ -z "$KEY_NAME" ]; then
  echo "Usage: $0 <key_name>"
  exit 1
fi
ssh-keygen -t rsa -b 4096 -f "$KEY_NAME" -N ""