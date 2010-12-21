mkdir -p "$TFTP_ROOT/archlinux/"
cd "$TFTP_ROOT/archlinux"
rm archlinux_x86_64.iso
wget -O archlinux_2010.05_x86_64.iso https://downloads.archlinux.de/iso/2010.05/archlinux-2010.05-netinstall-x86_64.iso
