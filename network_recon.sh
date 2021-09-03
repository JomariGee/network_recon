#/bin/bash

#---------------------------------------------
# Automates the Recon for a Subnet
#---------------------------------------------

# Colors
	Red=$'\e[1;31m'
	Green=$'\e[1;32m'
	Orange=$'\e[1:33m'
	Blue=$'\e[1;34m'
	Purple=$'\e[1;35m'
	White=$'\e[0m'

# Get Subnet
	read -p 'Enter the Subnet: '$Green IP
	echo"" $Blue

# Fping 
	echo "----------------------- Fping --------------------------"
	echo $White
	fping -a -g $IP 2> /dev/null | tee ./fping.txt 

# Pass Fping to Nmap 
	echo"" 
	echo $Orange
	echo "----------------------- Nmap --------------------------"
	echo $White
	nmap -A -iL fping.txt | tee ./mass_targets_nmap.txt