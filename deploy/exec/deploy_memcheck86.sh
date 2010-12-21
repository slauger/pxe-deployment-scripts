mkdir -p "$TFTP_ROOT/other/memtest86/"
cd "$TFTP_ROOT/other/memtest86"
rm *
wget -O memtest86.iso.gz "http://www.memtest86.com/memtest86-3.5a.iso.gz"
gzip -d memtest86.iso.gz
