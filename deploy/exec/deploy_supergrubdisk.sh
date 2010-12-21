mkdir -p "$TFTP_ROOT/other/supergrubdisk/"
cd "$TFTP_ROOT/other/supergrubdisk"
rm *
wget -O supergrubdisk.iso http://download2.berlios.de/supergrub/super_grub_disk_0.9799.iso
