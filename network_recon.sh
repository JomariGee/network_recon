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
	echo "----------------------- Fast Nmap Scan --------------------------"
	echo $White
	nmap -A -iL fping.txt | tee ./nmap.txt

# Scan All Ports w/Nmap
# Added this in because I didn't want to eventually miss something with the scan above, but still want fast resutls
	echo $Purple
	echo "----------------------- Full Port Scan --------------------------"	
	echo $White
	nmap -A -v -Pn -p- -T4 --open -n -iL fping.txt | tee ./full_nmap.txt
