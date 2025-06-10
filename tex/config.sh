#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#               :
#               :
# STATUS        : BETA
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Create ssh machine keys
#--------------------------------------
if [ -f /usr/sbin/sshd-gen-keys-start ]; then
    /usr/sbin/sshd-gen-keys-start
fi

(cd /usr/share/locale && find -name "*.mo" | xargs rm)

packages="
texinfo
makeinfo
texlive-pdfcrop-bin
texlive-epstopdf-bin
texlive-pst-pdf-bin
texlive-latex-bin-bin
"

for _p in $packages; do
    /usr/local/bin/bin-from-package $_p
done
