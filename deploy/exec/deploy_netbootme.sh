mkdir -p "$TFTP_ROOT/other/netbootme/"
cd "$TFTP_ROOT/other/netbootme"
rm *
wget http://static.netboot.me/gpxe/netbootme.iso
