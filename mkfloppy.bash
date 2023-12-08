#!/bin/bash
RED='\033[0;31m'
GRN='\033[0;32m'
BRN='\033[0;33m'
NC='\033[0m'
if [[ -z $1 || $1 == "-h" || $1 == "--help" ]]
then
echo "Usage: mkfloppy [image_name]"
else
dd bs=512 count=2880 if=/dev/zero of=$1.img
mkfs.msdos $1.img
echo -e "${GRN}Empty 1.44M floppy created with success!${NC}"
echo -e "${BRN}Mount floppy, so you can transfer files (enter to continue or ctrl+c to quit)? (requires su)${NC}"
read -s
sudo mkdir /media/mkfloppy
sudo mount -o loop $1.img /media/mkfloppy
if [[ -d "/media/mkfloppy" ]]
then
echo -e "${BRN}Enter files to copy to floppy: ${NC}"
read FILES
sudo cp $FILES /media/mkfloppy
echo -e "${BRN}Umount floppy (enter to continue or ctrl+c to quit)?${NC}"
read -s
sudo umount /media/mkfloppy
sudo rmdir /media/mkfloppy
echo -e "${GRN}Success!${NC}"
else
exit
fi
fi
