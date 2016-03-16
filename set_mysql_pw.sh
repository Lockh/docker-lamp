#!/bin/bash

if [ -f /.mysql_p ]; then
        echo "Root password for MYSQL already set!"
        exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )

/usr/sbin/mysqld &
sleep 10
echo "GRANT ALL ON *.* TO root@'localhost' IDENTIFIED BY '$PASS' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

echo "=> Done!"
touch /root/.mysql_p
echo "$PASS" > /root/.mysql_p

echo "========================================================================"
echo "You can now connect to this MYSQL container using this password :"
echo "enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
