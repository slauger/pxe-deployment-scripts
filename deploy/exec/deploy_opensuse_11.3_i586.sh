mkdir -p "$TFTP_ROOT/opensuse/"
cd "$TFTP_ROOT/opensuse"
rm openSUSE-i586.iso
wget -O openSUSE-i586.iso http://ftp.uni-kl.de/pub/linux/opensuse/distribution/11.3/iso/openSUSE-11.3-NET-i586.iso
