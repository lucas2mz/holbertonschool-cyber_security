#!/bin/bash
[ "$(sha256sum -c "$1" | cut -d' ' -f1)" = "$2" ] && echo "$1: OK" || echo "$1: FAILED"