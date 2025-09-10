#!/bin/bash
sudo curl -X POST -H "Host: $1" "$2" -d "$3"