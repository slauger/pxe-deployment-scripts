mkdir -p "$TFTP_ROOT/other/dell_diag32/"
cd "$TFTP_ROOT/other/dell_diag32"
rm *
wget -O dell_diag32.iso http://ftp.us.dell.com/diags/cdd_1284.iso
