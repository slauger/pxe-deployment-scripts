#!/usr/bin/env bash
# Debian + Ubuntu Live Builder
# ./deploy_live_linux.sh debian lenny i386 minimal

source ../config.sh

########################################
# CONFIG STARTS HERE
########################################

# todo: statischen shit ausbauen
#export TFTP_ROOT="/srv/tftp/boot/"
#export NFS_SERVER="192.168.168.1"
#export NFS_ROOT="/srv/nfsroot/

CF_MODE="$1" # "debian"
CF_DIST="$2" # "lenny"
CF_ARCH="$3" # "i386"
CF_TYPE="$4" # "standard" # minimal or standard

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ] || [ "$4" = "" ]; then
	echo "Syntax:  ./deploy_live_linux.sh <debian|ubuntu> <version> <arch> <standard|minimal>"
	echo "Example: ./deploy_live_linux.sh debian lenny i386 minimal"
	exit 1
fi

# generate label/codename
if [ "$CF_ARCH" = "amd64" ]; then
        CF_LABEL="$CF_DIST"64
else
        CF_LABEL="$CF_DIST"32
fi

CF_HOSTNAME="$CF_LABEL"
CF_NFS_SERVER="$NFS_SERVER"
CF_NFS_ROOT="$NFS_ROOT$CF_LABEL"

# Build root
CF_ROOT="/chroot"

# Zusaetzliche Pakete
CF_PKGS="lsof screen pwgen"

# Mirror Sites und 
if [ "$CF_MODE" = "ubuntu" ]; then
	CF_MMIR="ftp://archive.ubuntu.com/ubuntu"
	CF_SMIR="ftp://security.ubuntu.com/ubuntu"
	CF_VMIR="false"
	CF_BMIR="false"
	CF_SECURITY="false"
	CF_VOLATILE="false" # non existent
	CF_BACKPORTS="false" # exists in main repo, "maverick-backports"
	CF_ARCHIVE="main multiverse restricted universe"
else
	CF_MMIR="ftp://ftp.de.debian.org/debian/"
	CF_SMIR="ftp://ftp.de.debian.org/debian-security/"
	CF_VMIR="ftp://ftp.de.debian.org/debian-volatile/"
	CF_BMIR="ftp://ftp.de.debian.org/debian-backports/"
	CF_SECURITY="true"
	CF_VOLATILE="false" # stable only
	CF_BACKPORTS="false"
	CF_ARCHIVE="main non-free contrib"
fi

########################################
# START BUILDING LIVE IMAGE NOW
########################################

mkdir -p "$CF_ROOT/$CF_MODE-live/$CF_DIST-$CF_ARCH"
cd "$CF_ROOT/$CF_MODE-live/$CF_DIST-$CF_ARCH"

#lb clean

# spaeter sollte noch --net-tarball gzip eingepflegt werden
# --apt-secure wird unter ubuntu benoetigt um einen gpgv bug zu umgehen
#--initramfs live-boot \
lb config \
	--mirror-bootstrap "$CF_MMIR" \
	--mirror-chroot-security "$CF_SMIR" \
	--mirror-chroot-volatile "$CF_VMIR" \
	--mirror-chroot-backports "$CF_BMIR" \
	--mirror-binary "$CF_MMIR" \
	--mirror-binary-security "$CF_SMIR" \
	--mirror-binary-volatile "$CF_VMIR" \
	--mirror-binary-backports "$CF_BMIR" \
	--archive-areas "$CF_ARCHIVE" \
	--security "$CF_SECURITY" \
	--volatile "$CF_VOLATILE" \
	--backports "$CF_BACKPORTS" \
	--mode "$CF_MODE" \
	--distribution "$CF_DIST" \
	--architecture "$CF_ARCH" \
	--packages "$CF_PKGS" \
	--hostname "$CF_HOSTNAME" \
	--username root \
	--net-root-filesystem nfs \
	--net-root-server "$CF_NFS_SERVER" \
	--net-root-path "$CF_NFS_ROOT" \
	--binary-images net \
	--bootstrap-flavour "$CF_TYPE" \
	--bootloader syslinux \
	--apt-secure disable \
	--memtest none \
	--win32-loader false

# hier weitere tolle sachen -> init scripte etc
# ...

lb build

if [ "$?" != "0" ]; then
	echo ""
	echo "Error: Bulding Live Image Failed ($CF_MODE/$CF_DIST/$CF_ARCH)"
	exit 1
fi

########################################
# CREATING PXE TFTP CONFIGURATION
########################################

echo "/chroot/$CF_MODE-live/$CF_DIST-$CF_ARCH/tftpboot/debian-live/$CF_ARCH/boot-screens/live.cfg"

# pxe konfiguration schreiben
(
	echo "label $CF_LABEL"
	head -n 5 "/chroot/$CF_MODE-live/$CF_DIST-$CF_ARCH/tftpboot/debian-live/$CF_ARCH/boot-screens/live.cfg" | tail -n 3 | sed "s/\/$CF_ARCH\//\/$CF_LABEL\//g" | sed "s/debian-live/boot\/$CF_MODE-live/g"
) > /srv/tftp/conf/images/"$CF_LABEL"_live.conf

exit

mkdir -p "$CF_NFS_ROOT"
mkdir -p "/srv/tftproot/boot/$CF_MODE-live/$CF_LABEL"

# kernel und root filesystem kopieren
cp -av "/chroot/ubuntu-live/maverick-i386/tftpboot/debian-live/i386" "/srv/tftp/boot/ubuntu-live/materick32"
cp -av "/chroot/ubuntu-live/maverick-i386/binary/*" "/srv/nfsroot/"

cp -av /chroot/"$CF_MODE"-live/"$CF_DIST"-"$CF_ARCH"/tftpboot/debian-live/"$CF_ARCH"/* /srv/tftp/boot/"$CF_MODE"-live/"$CF_LABEL"
if [ -d "/chroot/$CF_MODE-live/$CF_DIST-$CF_ARCH/binary/live" ]; then
	cp -av "/chroot/$CF_MODE-live/$CF_DIST-$CF_ARCH/binary/live/" "$CF_NFS_ROOT/"
else
	cp -av "/chroot/$CF_MODE-live/$CF_DIST-$CF_ARCH/binary/casper/" "$CF_NFS_ROOT/"
fi
