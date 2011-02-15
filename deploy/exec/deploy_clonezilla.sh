# clonzilla i486
rm -rfv "$TFTP_ROOT/clonezilla/"
rm -rfv "$NFS_ROOT/clonezilla/"
mkdir -p "$NFS_ROOT/clonezilla"
mkdir -p "$TFTP_ROOT/clonezilla"
cd "$TFTP_ROOT/clonezilla"
wget -O clonezilla.zip "http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/1.2.6-59/clonezilla-live-1.2.6-59-i486.zip?r=&ts=1297793395&use_mirror=kent"
unzip clonezilla.zip -d "$NFS_ROOT/clonezilla"
rm clonezilla.zip
cp -v "$NFS_ROOT/clonezilla/live/filesystem.squashfs" "$TFTP_ROOT/clonezilla/"
cp -v "$NFS_ROOT/clonezilla/live/vmlinuz" "$TFTP_ROOT/clonezilla/"
cp -v "$NFS_ROOT/clonezilla/live/initrd.img" "$TFTP_ROOT/clonezilla/"
