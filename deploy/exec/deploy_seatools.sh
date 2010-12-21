mkdir -p "$TFTP_ROOT/other/seatools/"
cd "$TFTP_ROOT/other/seatools"
rm seatools.iso
wget -O seatools.iso http://www.seagate.com/staticfiles/support/seatools/SeaToolsDOS222ALL.576.ISO
