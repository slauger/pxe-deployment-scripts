mkdir -p "$TFTP_ROOT/other/memtest86p/"
cd "$TFTP_ROOT/other/memtest86p"
rm *
wget -O memtest86p.iso.gz "http://www.memtest.org/download/4.10/memtest86+-4.10.iso.gz"
gzip -d memtest86p.iso.gz
