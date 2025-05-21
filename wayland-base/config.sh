#!/bin/bash
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
rm /var/run
mkdir -p /var/run/user/1000
chown user: /var/run/user/1000
