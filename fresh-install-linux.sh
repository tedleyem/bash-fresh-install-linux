#!/bin/bash 
# Name: Fresh Install
# Author: Tedley Meralus 
# Contact: @TechGameTeddy
# Menu driven script to automate and download a list of popular tools and utilities 
# to install on a Linux desktop
# inspired by OMG Ubuntu's infamous 
# Top Things to do after Installing Ubuntu xx.xx articles
# check them out at http://www.omgubuntu.co.uk/2017/04/things-to-do-after-installing-ubuntu-17-04
#
# Define Variables 
STARTOFSCRIPT='date'
#ALLPPA="AllPPA"
INSTALL="sudo apt-get install "
ADDPPA="sudo add-apt-repository "
ALLPPA="ppa:dawidd0811/neofetch ppa:vlijm/spaceview ppa:gerardpuig/ppa ppa:shutter/ppa ppa:atareao/atareao"
SEARCH="apt-cache search "
SHOW="apt-cache showpkg "
#UPDATE="apt-get udpate"
PPADIR="/etc/apt/sources.list.d/"

# Variables to install all available ppa's 
nvidia="ppa:graphics-drivers/ppa" #Nvidia ppa 
neoppa="ppa:dawidd0811/neofetch" #neofetch ppa 
sviewppa="ppa:vlijm/spaceview" #spaceview ppa
gerardpuig="ppa:gerardpuig/ppa" #ubuntu cleaner ppa
shutppa="ppa:shutter/ppa" #Shutter screenshot ppa 
atareaoppa="ppa:atareao/atareao" #national-geographic-wallpaper ppa

#Variables for apps being installed
ALLAPPS="android-tools-adb android-tools-fastboot chromium-browser docker elinks filezilla gimp git coreutils inkscape libappindicator1 libindicator7 evolution national-geographic-wallpaper neofetch npm playonlinux putty shutter steam synaptic terminator tor transmission ubuntu-cleaner unity-tweak-tool uget vagrant virtualbox open-vm-tools-desktop"
# ----------------------------------
# function to display menus
# ----------------------------------
show_menus() {
	clear
	date
	echo "|--------------------------------------------------------"
	echo "|--------------------------------------------------------"	
	echo "|         FRESH INSTALL                                  " 
	echo "|--------------------------------------------------------" 
	echo "| Essential tools/utilities to install 				   "
	echo "| after installing the latest version of Ubuntu          "
	echo "| created By @TechGameTeddy                              "
	echo "|                                                        "
	echo "|1. Run unattended installer                             "
	echo "|2. Install Dependancies                                 "
	echo "|3. Check Software List                                  "
	echo "|4. Exit                                                 " 
	echo "|--------------------------------------------------------"
}
software_list() {
	write_header " Package List "
	clear
	echo "|---------------------------------------------------"	
	echo "|  Essential Tools to install post installing Ubuntu" 
	echo "|---------------------------------------------------"
	echo "|	Android Device Manager" 
	echo "|	Chromium"
	echo "|	Filezilla"
	echo "|	docker" 
	echo "|	links" 
	echo "|	coreutils"  
	echo "|	vagrant" 
	echo "|	libappindicator1" 
	echo "|	libindicator7"
	echo "| evolution"
	echo "|	national-geographic-wallpaper" 
	echo "|	neofetch" 
	echo "|	npm" 
	echo "|	playonlinux" 
	echo "|	putty" 
	echo "|	shutter" 
	echo "|	steam" 
	echo "|	synaptic" 
	echo "|	terminator" 
	echo "|	tor" 
	echo "|	transmission" 
	echo "|	ubuntu-cleaner" 
	echo "|	unity-tweak-tool" 
	echo "|	uget" 
	echo "|	vagrant" 
	echo "|	virtualbox"
	echo "|	open-vm-tools-desktop"            
	echo "|	Gimp"
	echo "|	Git"
	echo "|	GNU Coreutils"
	echo "|	Inkscape"
	echo "|	Putty"
	echo "| Shutter"
	echo "|	Steam"  
	echo "|	Synaptic Package Manager"
	echo "|	Tor"
	echo "|	Transmission"
	echo "|	Ubuntu System Cleaner"
	echo "|	Unity Tweak Tool"
	echo "| Visual Studio Code"
	echo "| Virtual Box"
	echo "|  "
	echo "|  press "m" to go back to the main menu" 
	echo "|---------------------------------------------------"
	sl_options
}
# ----------------------------------
#  UNATTENDED INSTALLER FUNCTION
# ----------------------------------
uinstaller(){
	echo "Installer started"
	echo "Downloading Dependancies"
	sudo apt-add-repository ${ALLPPA[*]}
	echo "All Dependancies installed"
	echo "Updating system now"
	$UPDATE
	echo "Update complete"
	echo "Installing all packages"
	sudo apt-get install ${ALLAPPS[*]}
        pause
}
#
# ----------------------------------
#  PPA Check
# ----------------------------------
checkppa(){
if [ $PPADIR eq=1 ]; then 
echo "shoulder shrug" 
fi
}
#
# ----------------------------------
#  Return functions
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
# ----------------------------------
#back to main menu
# ----------------------------------
backtomain(){
  show_menus
}
# ----------------------------------
#  Main Menu Option
# ----------------------------------
one(){
	while true; do
	read -p "Are you sure you want to run the unattended installer?[y/n]" input
	case $input in
	[yY][eE][sS]|[yY])
		uinstaller
		;; 
	[nN][oO]|[nN])
		backtomain
       		break;;
    *)
	echo "Invalid input..."
#	echo "Please (y)Yes or (n)No 
	;;
esac
done
        pause
}
## Option two Update PPA List ()
two(){
	sudo apt-add-repository ${ALLPPA[*]}
        pause
}
## Option three Check Software List()
three(){
	software_list
        #pause
}
## Option four Exit ()
four(){
	clear
	exit
}
# ----------------------------------
#  MAIN MENU
# ----------------------------------
read_options(){
	local choice
	read -p "Enter your choice [ 1 - 4] " choice
	case $choice in
		1) one    ;;
		2) two    ;;
		3) three  ;;
		4) four   ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
# ----------------------------------
#  SOFTWARE LIST MENU 
# ----------------------------------
sl_options(){
	local softchoice
	read -p "Enter choice [ 001 - 020] " softchoice
	case $softchoice in
		001) SL1  ;;
		002) SL2  ;;
		003) SL3  ;;
	[mM])
		show_menus
       		;;
		*) echo -e "${RED}Invalid option choose [ 001 - 020] or "m" to quit...${STD}" && sleep 2
       		clear     
		software_list 
		       ;;
esac
}
# ----------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# ----------------------------------
# Main Menu logic - infinite loop
# ----------------------------------
while true
do
	show_menus
	read_options
	date_and_time
done
