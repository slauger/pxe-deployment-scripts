# grml64 2010.12
# date: 15.02.2011
# author: cmon2k
rm -rfv "$TFTP_ROOT/grml/grml64/"
mkdir -p "$TFTP_ROOT/grml/grml64"
cd "$TFTP_ROOT/grml/grml64"
wget -O grml64.iso "http://modprobe.de/grml//grml64-medium_2010.12.iso"
mkdir -p "/tmp/grml64"
mount -o loop grml64.iso /tmp/grml64/
cp -v /tmp/grml64/live/grml64-medium.squashfs .
cp -v /tmp/grml64/boot/grml64medium/initrd.gz .
cp -v /tmp/grml64/boot/grml64medium/linux26 .
umount /tmp/grml64
rmdir /tmp/grml64
rm grml64.iso
