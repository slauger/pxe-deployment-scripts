mkdir -p "$TFTP_ROOT/debian"
cd "$TFTP_ROOT/debian"
rm -rf debian6-installer-amd64*
mkdir debian6-installer-amd64
wget -O debian6-installer-amd64.tar.gz http://ftp.nl.debian.org/debian/dists/squeeze/main/installer-amd64/current/images/netboot/netboot.tar.gz
cd debian6-installer-amd64
tar -xf ../debian5-installer-amd64.tar.gz
