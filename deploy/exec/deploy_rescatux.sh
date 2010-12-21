mkdir -p "$TFTP_ROOT/other/rescatux/"
cd "$TFTP_ROOT/other/rescatux"
rm *
wget -O rescatux.iso http://download.berlios.de/rescatux/rescatux_cdrom_usb_hybrid_i386_486-amd64_2010_12_06.iso
