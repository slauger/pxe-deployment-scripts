mkdir -p "$TFTP_ROOT/archlinux/"
cd "$TFTP_ROOT/archlinux"
rm archlinux_i686.iso
wget -O archlinux_2010.05_i686.iso https://downloads.archlinux.de/iso/2010.05/archlinux-2010.05-netinstall-i686.iso
