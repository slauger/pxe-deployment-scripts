mkdir -p "$TFTP_ROOT/debian"
cd "$TFTP_ROOT/debian"
rm -rf debian-installer-i386*
mkdir debian5-installer-i386
wget -O debian5-installer-i386.tar.gz http://ftp.nl.debian.org/debian/dists/lenny/main/installer-i386/current/images/netboot/netboot.tar.gz
cd debian5-installer-i386
tar -xf ../debian5-installer-i386.tar.gz
