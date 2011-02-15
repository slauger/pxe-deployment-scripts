# memtest86+ 4.20
# date: 15.02.2011
# author: cmon2k
mkdir -p "$TFTP_ROOT/other/memtest86+/"
cd "$TFTP_ROOT/other/memtest86+"
rm *
wget -O memtest86+.bin.img.gz "http://www.memtest.org/download/4.20/memtest86+-4.20.bin.gz"
gzip -d memtest86+.bin.img.gz

