#!/bin/bash

useradd -m $1
passwd $1
mkdir -p /shared/$l
chown $1.users /shared/$l
chmod 775 /shared/$l
ln -s /shared/$l /home/$l/shared
chown $1.users /home/$l/shared
