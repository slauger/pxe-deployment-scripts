#!/usr/bin/env bash
# Debian + Ubuntu Live Builder

########################################
# CONFIG STARTS HERE
########################################

CONFIG_MODE="debian"
CONFIG_DIST="lenny"
CONFIG_ARCH="i386"
CONFIG_TYPE="standard" # minimal or standard

# generate label/codename
if [ "$CONFIG_ARCH" = "amd64" ]; then
        CONFIG_LABEL="$CONFIG_DIST"64
else
        CONFIG_LABEL="$CONFIG_DIST"32
fi

CONFIG_HOSTNAME="$CONFIG_LABEL"

CONFIG_NFS_SERVER="212.123.113.34"
CONFIG_NFS_ROOT="/srv/nfsroot/$CONFIG_LABEL"

# Build root
CONFIG_ROOT="/chroot"

# Zusaetzliche Pakete
CONFIG_PKGS="lsof screen pwgen"

# Mirror Sites und 
if [ "$CONFIG_MODE" = "ubuntu" ]; then
	CONFIG_MMIR="ftp://archive.ubuntu.com/ubuntu"
	CONFIG_SMIR="ftp://security.ubuntu.com/ubuntu"
	CONFIG_VMIR="false"
	CONFIG_BMIR="false"
	CONFIG_SECURITY="false"
	CONFIG_VOLATILE="false" # non existent
	CONFIG_BACKPORTS="false" # exists in main repo, "maverick-backports"
	CONFIG_ARCHIVE="main multiverse restricted universe"
else
	CONFIG_MMIR="ftp://ftp.de.debian.org/debian/"
	CONFIG_SMIR="ftp://ftp.de.debian.org/debian-security/"
	CONFIG_VMIR="ftp://ftp.de.debian.org/debian-volatile/"
	CONFIG_BMIR="ftp://ftp.de.debian.org/debian-backports/"
	CONFIG_SECURITY="true"
	CONFIG_VOLATILE="false" # stable only
	CONFIG_BACKPORTS="false"
	CONFIG_ARCHIVE="main non-free contrib"
fi

########################################
# START BUILDING LIVE IMAGE NOW
########################################

mkdir -p "$CONFIG_ROOT/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH"
cd "$CONFIG_ROOT/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH"

#lb clean

# spaeter sollte noch --net-tarball gzip eingepflegt werden
# --apt-secure wird unter ubuntu benoetigt um einen gpgv bug zu umgehen
#--initramfs live-boot \
lb config \
	--mirror-bootstrap "$CONFIG_MMIR" \
	--mirror-chroot-security "$CONFIG_SMIR" \
	--mirror-chroot-volatile "$CONFIG_VMIR" \
	--mirror-chroot-backports "$CONFIG_BMIR" \
	--mirror-binary "$CONFIG_MMIR" \
	--mirror-binary-security "$CONFIG_SMIR" \
	--mirror-binary-volatile "$CONFIG_VMIR" \
	--mirror-binary-backports "$CONFIG_BMIR" \
	--archive-areas "$CONFIG_ARCHIVE" \
	--security "$CONFIG_SECURITY" \
	--volatile "$CONFIG_VOLATILE" \
	--backports "$CONFIG_BACKPORTS" \
	--mode "$CONFIG_MODE" \
	--distribution "$CONFIG_DIST" \
	--architecture "$CONFIG_ARCH" \
	--packages "$CONFIG_PKGS" \
	--hostname "$CONFIG_HOSTNAME" \
	--username root \
	--net-root-filesystem nfs \
	--net-root-server "$CONFIG_NFS_SERVER" \
	--net-root-path "$CONFIG_NFS_ROOT" \
	--binary-images net \
	--bootstrap-flavour "$CONFIG_TYPE" \
	--bootloader syslinux \
	--apt-secure disable \
	--memtest none \
	--win32-loader false

# hier weitere tolle sachen -> init scripte etc
# ...

lb build

if [ "$?" != "0" ]; then
	echo ""
	echo "Error: Bulding Live Image Failed ($CONFIG_MODE/$CONFIG_DIST/$CONFIG_ARCH)"
	exit 1
fi

########################################
# CREATING PXE TFTP CONFIGURATION
########################################

echo "/chroot/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH/tftpboot/debian-live/$CONFIG_ARCH/boot-screens/live.cfg"

# pxe konfiguration schreiben
(
	echo "label $CONFIG_LABEL"
	head -n 5 "/chroot/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH/tftpboot/debian-live/$CONFIG_ARCH/boot-screens/live.cfg" | tail -n 3 | sed "s/\/$CONFIG_ARCH\//\/$CONFIG_LABEL\//g" | sed "s/debian-live/boot\/$CONFIG_MODE-live/g"
) > /srv/tftp/conf/images/"$CONFIG_LABEL"_live.conf

exit

mkdir -p "$CONFIG_NFS_ROOT"
mkdir -p "/srv/tftproot/boot/$CONFIG_MODE-live/$CONFIG_LABEL"

# kernel und root filesystem kopieren
cp -av "/chroot/ubuntu-live/maverick-i386/tftpboot/debian-live/i386" "/srv/tftp/boot/ubuntu-live/materick32"
cp -av "/chroot/ubuntu-live/maverick-i386/binary/*" "/srv/nfsroot/"

cp -av /chroot/"$CONFIG_MODE"-live/"$CONFIG_DIST"-"$CONFIG_ARCH"/tftpboot/debian-live/"$CONFIG_ARCH"/* /srv/tftp/boot/"$CONFIG_MODE"-live/"$CONFIG_LABEL"
if [ -d "/chroot/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH/binary/live" ]; then
	cp -av "/chroot/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH/binary/live/" "$CONFIG_NFS_ROOT/"
else
	cp -av "/chroot/$CONFIG_MODE-live/$CONFIG_DIST-$CONFIG_ARCH/binary/casper/" "$CONFIG_NFS_ROOT/"
fi
