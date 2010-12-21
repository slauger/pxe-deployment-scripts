mkdir -p "$TFTP_ROOT/debian"
cd "$TFTP_ROOT/debian"
rm -rf debian-installer-amd64*
mkdir debian5-installer-amd64
wget -O debian5-installer-amd64.tar.gz http://ftp.nl.debian.org/debian/dists/lenny/main/installer-amd64/current/images/netboot/netboot.tar.gz
cd debian5-installer-amd64
tar -xf ../debian5-installer-amd64.tar.gz
