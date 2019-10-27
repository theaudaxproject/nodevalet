#!/bin/bash

# Set Variables
INSTALLDIR='/var/tmp/nodevalet'
INFODIR='/var/tmp/nvtemp'
PROJECT=$(<$INFODIR/vpscoin.info)
MNS=$(<$INFODIR/vpsnumber.info)
LOGFILE='/var/tmp/nodevalet/logs/maintenance.log'
MNODE_DAEMON=$(<$INSTALLDIR/temp/MNODE_DAEMON)
HNAME=$(<$INFODIR/vpshostname.info)
PROJECTl=${PROJECT,,}
PROJECTt=${PROJECTl~}

clear

# Proceed to check if each masternode is synced or not
for ((i=1;i<=$MNS;i++));
do
    echo -e " $(date +%m.%d.%Y_%H:%M:%S) : Checking if ${PROJECT}_n${i} is synced." | tee -a "$LOGFILE"
    sudo bash $INSTALLDIR/maintenance/cronchecksync2.sh "$i"
    sleep 5
done

echo -e " \n" | tee -a "$LOGFILE"

exit