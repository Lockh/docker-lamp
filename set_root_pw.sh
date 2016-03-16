#!/bin/bash

if [ -f /.p ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /root/.p
echo "$PASS" > /root/.p

echo "========================================================================"
echo "You can now connect to this Debian container via SSH using:"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
