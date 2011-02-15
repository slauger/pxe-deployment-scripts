# memtest86 3.5a
# date: 15.02.2011
# author: cmon2k
mkdir -p "$TFTP_ROOT/other/memtest86/"
cd "$TFTP_ROOT/other/memtest86"
rm *
wget -O memtest86.iso.gz "http://www.memtest86.com/memtest86-3.5a.iso.gz"
gzip -d memtest86.iso.gz
mkdir -p /tmp/memtest86
mount -o loop memtest86.iso /tmp/memtest86
cp -v /tmp/memtest86/isolinux/memtest .
cp -v /tmp/memtest86/isolinux/memtest.34 .
cp -v /tmp/memtest86/isolinux/memtest.smp .
umount /tmp/memtest86
rmdir /tmp/memtest86
rm memtest86.iso
