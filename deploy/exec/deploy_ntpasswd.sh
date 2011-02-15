mkdir -p "$TFTP_ROOT/other/ntpasswd/"
cd "$TFTP_ROOT/other/ntpasswd"
rm *
wget http://pogostick.net/~pnh/ntpasswd/cd100627.zip
unzip cd100627.zip
rm cd100627.zip
mv *.iso ntpasswd.iso
