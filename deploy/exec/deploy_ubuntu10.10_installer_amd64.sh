mkdir -p "$TFTP_ROOT/ubuntu"
cd "$TFTP_ROOT/ubuntu"
rm -rf ubuntu10.10-installer-amd64*
mkdir ubuntu10.10-installer-amd64
wget -O ubuntu10.10-installer-amd64.tar.gz http://de.archive.ubuntu.com/ubuntu/dists/maverick/main/installer-amd64/current/images/netboot/netboot.tar.gz
cd ubuntu10.10-installer-amd64
tar -xf ../ubuntu10.10-installer-amd64.tar.gz
