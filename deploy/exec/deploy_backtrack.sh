# backtrack 4 R2
# date: 15.02.2011
# author: cmon2k
rm -rfv "$TFTP_ROOT/backtrack/"
mkdir -p "$TFTP_ROOT/backtrack"
cd "$TFTP_ROOT/backtrack"
wget -O backtrack.iso "http://www.backtrack-linux.org/download.php?fname=bt4r2"
