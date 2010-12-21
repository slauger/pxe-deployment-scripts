mkdir -p "$TFTP_ROOT/reactos/"
cd "$TFTP_ROOT/reactos"
rm reactos.iso
wget -O reactos.zip "http://downloads.sourceforge.net/project/reactos/ReactOS/0.3.12/ReactOS-0.3.12-REL-live.zip?r=&ts=1292787879&use_mirror=fastbull"
unzip reactos.zip
rm reactos.zip

