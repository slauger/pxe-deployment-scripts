mkdir -p "$TFTP_ROOT/other/supergrubdisk/"
cd "$TFTP_ROOT/other/supergrubdisk"
rm *
wget -O supergrubdisk.img http://download.berlios.de/supergrub/super_grub_disk_english_floppy_0.9799.img
#wget -O supergrubdisk.iso http://download2.berlios.de/supergrub/super_grub_disk_0.9799.iso
