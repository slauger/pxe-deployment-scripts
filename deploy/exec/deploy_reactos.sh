# reactos 0.3.1.2
# date: 15.02.2011
# author: cmon2k
mkdir -p "$TFTP_ROOT/reactos/"
cd "$TFTP_ROOT/reactos"
rm *
wget -O reactos.zip "http://downloads.sourceforge.net/project/reactos/ReactOS/0.3.12/ReactOS-0.3.12-REL-live.zip?r=&ts=1297797642&use_mirror=heanet"
unzip reactos.zip
rm reactos.zip

