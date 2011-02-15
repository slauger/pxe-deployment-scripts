#!/usr/bin/env bash

# tftp root
cd /srv/tftp

# fix permissions
chown -R tftp:root ./
find -type f -exec chmod 664 {} \;
find -type d -exec chmod 775 {} \;

# reset permissions of this file
chmod +x "$0" deploy/deploy.sh

# link
ln -s /srv/tftp/pxelinux.cfg/default default

# done
echo Ok.
