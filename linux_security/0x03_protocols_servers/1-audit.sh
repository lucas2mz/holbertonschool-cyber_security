#!/bin/bash
grep -v '^#' /etc/ssh/ssh_config | grep -v '^$'