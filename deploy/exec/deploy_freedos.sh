mkdir -p "$TFTP_ROOT/other/freedos/"
cd "$TFTP_ROOT/other/freedos"
rm fdboot.img
wget -O fdboot.img http://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.0/fdboot.img
