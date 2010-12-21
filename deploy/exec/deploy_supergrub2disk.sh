mkdir -p "$TFTP_ROOT/other/supergrub2disk/"
cd "$TFTP_ROOT/other/supergrub2disk"
rm *
wget -O supergrub2disk.iso http://download.berlios.de/supergrub/super_grub_disk_hybrid-1.98s1.iso
