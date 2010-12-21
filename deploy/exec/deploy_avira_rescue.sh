mkdir -p "$TFTP_ROOT/other/avira/"
cd "$TFTP_ROOT/other/avira"
rm avira_rescue_system.iso
wget -O avira_rescue_system.iso http://dlpro.antivir.com/package/rescue_system/common/en/rescue_system-common-en.iso
