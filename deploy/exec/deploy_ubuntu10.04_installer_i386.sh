mkdir -p "$TFTP_ROOT/ubuntu"
cd "$TFTP_ROOT/ubuntu"
rm -rf ubuntu10.04-installer-i386*
mkdir ubuntu10.04-installer-i386
wget -O ubuntu10.04-installer-i386.tar.gz http://de.archive.ubuntu.com/ubuntu/dists/lucid/main/installer-i386/current/images/netboot/netboot.tar.gz
cd ubuntu10.04-installer-i386
tar -xf ../ubuntu10.04-installer-i386.tar.gz
