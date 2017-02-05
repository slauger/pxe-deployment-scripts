# PXE Deployment Scipts

## Verzeichnisse / Dateien 

```
permissions.sh		Resettet die Rechte (Files auf 664, Folder auf 775, tftp:root)

boot/				Generierte Boot-Images; Hier sollten keine ISO-Files einfach
					so abgelegt werden. Fuer jedes Image sollte ein Deploscript 
					geschrieben werden

conf/				Konfigurationsdateien fuer den TFTP/PXE-Server, bzw. das 
					Auswahlmenue

deploy/				Deploy-Scripte, siehe deploy/README
```

## Benoetigte Debian-Pakete

```
dhcp3-server		Wenn dieser Server nicht nur TFTP, sondern auch direkt
					den DHCP-Server spielen soll

tftpd-hpa			TFTP-Server

nfs-kernel-server	NFS Kernel Server

syslinux 			u.A. spaeter benoetigt um ISO Images zu booten
```