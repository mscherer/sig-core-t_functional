#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>
# Author: Christoph Galuschka <christoph.galuschka@chello.at>

t_Log "Running $0 - php can detect correct hostname."

# Comparing hostname with output of phpinfo()
HOST=$(hostname)
FILE='/var/tmp/php-test.php'

cat > $FILE <<EOF
<?php
phpinfo();
?>
EOF

# setting timezone for phpinfo
sed  -i 's/\;date\.timezone\ \=/date\.timezone = \"Europe\/Berlin\"/' /etc/php.ini

php $FILE | grep -cq 'HOSTNAME => '$HOST

t_CheckExitStatus $?

#reversing changes
/bin/rm $FILE
sed  -i 's/\date\.timezone\ \=\ \"Europe\/Berlin\"/\;date\.timezone\ \=/' /etc/php.ini
