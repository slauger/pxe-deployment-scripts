# grml 2010.12
# date: 15.02.2011
# author: cmon2k
rm -rfv "$TFTP_ROOT/grml/grml/"
mkdir -p "$TFTP_ROOT/grml/grml"
cd "$TFTP_ROOT/grml/grml"
wget -O grml.iso "http://download.grml.org/grml-medium_2010.04.iso"
mkdir -p "/tmp/grml"
mount -o loop grml.iso /tmp/grml/
cp -v /tmp/grml/live/grml-medium.squashfs .
cp -v /tmp/grml/boot/grmlmedium/initrd.gz .
cp -v /tmp/grml/boot/grmlmedium/linux26 .
umount /tmp/grml
rmdir /tmp/grml
rm grml.iso
