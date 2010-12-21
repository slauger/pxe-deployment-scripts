mkdir -p "$TFTP_ROOT/bko/"
cd "$TFTP_ROOT/bko"
rm bko.iso
wget -O bko.iso http://boot.kernel.org/gpxe_images/gpxe.iso

