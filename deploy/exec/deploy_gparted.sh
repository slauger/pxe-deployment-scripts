# gparted-live-0.7.1-5
# date: 15.02.2011
# author: cmon2k
rm -rfv "$TFTP_ROOT/gparted/"
mkdir -p "$TFTP_ROOT/gparted"
cd "$TFTP_ROOT/gparted"
wget -O gparted.zip "http://downloads.sourceforge.net/project/gparted/gparted-live-stable/0.7.1-5/gparted-live-0.7.1-5.zip?r=&ts=1297795095&use_mirror=garr"
unzip gparted.zip
rm gparted.zip
