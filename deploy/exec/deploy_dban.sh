rm -rf "$TFTP_ROOT/other/dban"
mkdir -p "$TFTP_ROOT/other/dban"
cd "$TFTP_ROOT/other/dban"
wget -O dban.iso "http://downloads.sourceforge.net/project/dban/dban/dban-2.2.6/dban-2.2.6_i586.iso?r=&ts=1292276764&use_mirror=kent"
mkdir /tmp/dban
mount -o loop dban.iso /tmp/dban
cp -av /tmp/dban/* .
umount /tmp/dban
rm -rfv dban.iso /tmp/dban

