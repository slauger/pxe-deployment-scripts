mkdir -p "$TFTP_ROOT/opensuse/"
cd "$TFTP_ROOT/opensuse"
rm openSUSE-x86_64.iso
wget -O openSUSE-x86_64.iso http://ftp.uni-kl.de/pub/linux/opensuse/distribution/11.3/iso/openSUSE-11.3-NET-x86_64.iso
