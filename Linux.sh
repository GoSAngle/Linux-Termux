

clear; echo ;echo "          Script | Make By GoSAngle."

echo 

echo "> Updating APT..."

apt update -y > /dev/null 2>&1

sleep 3

echo && echo "Done!."

echo ;echo "> Upgrading APT."

apt upgrade -y > /dev/null 2>&1 && echo && sleep 2

echo "Done!." && echo ;echo "> Updating PKG"

pkg update -y > /dev/null 2>&1 && sleep 3;echo 

e
cho "Done!." && echo && echo "> Upgrading PKG."

pkg upgrade -y > /dev/null 2>&1

echo && echo "Download x11-repo? (recommended) (Y/n): " x11repochoice && sleep 3

if [[ "$x11repochoice" = "Y" || "$x11repochoice" = "y" ]]; then
	echo && echo "> Downloading..."

	pkg install x11-repo -y > /dev/null 2>&1
	echo ;echo "Done!, Type termux-change-repo to change the repo."
elif [[ "$x11repochoice" = "N" || "$x11repochoice" = "n" ]]; then
		echo && echo "Ok, i got it."
	else
		echo && echo "Incorrect, installing x11-repo..."
fi

echo && echo "Cleaning the screen in 5."

sleep 5;clear && echo && echo "Installing Python and Python 2..."

echo && echo "> Downloading.."

pkg install python -y > /dev/null 2>&1 && pkg install python2 -y > /dev/null 2>&1

sleep 3 && echo && echo "Done!."; echo ;echo "> Downloading Ruby.."
echo && echo "Wait..."
pkg install ruby -y > /dev/null 2>&1

sleep 2 && echo ;echo "Done!." && echo 

read -p "Install Kali for NetHunter or Install others distributions for PROOT? (1 NH / 2 PRT): " Installchoice

if [[ "$Installchoice" = "1" ]]; then
	echo && echo "Please activate storage.."
	termux-setup-storage && sleep 3
	echo ; echo "Installing WGET..."
	pkg install wget > /dev/null 2>&1
	echo ;echo "Done!."
	echo && echo "Downloading Kali (NH)."
	wget -O install-nethunter-termux https://offs.ec/2MceZWr
	echo && echo "Setup Kali..";chmod +x install-nethunter-termux
	echo ;echo "Running Installer.."; sleep 5 && clear
	./install-nethunter-termux
	cd $HOME
	clear;echo && echo "Type NH or NetHunter to start a Kali"

elif [[ "$Installchoice" = "2" ]]; then
	echo && echo "Installing Proot.."
	pkg install proot-distro > /dev/null 2>&1 && echo ;echo "Done!."

	echo && echo "Setup Proot..";clear && echo "alpine: Alpine Linux (edge)
archlinux: Arch Linux ARM
artix: Artix Linux (AArch64 only)
debian: Debian (stable)
debian-oldstable: Debian (old stable)
deepin: Deepin (beige)
fedora: Fedora 39 (AArch64 only)
manjaro: Manjaro (AArch64 only)
openkylin: OpenKylin (Yangtze)
opensuse: OpenSUSE (Tumbleweed)
pardus: Pardus (yirmibir)
ubuntu: Ubuntu (23.10)
ubuntu-lts: Ubuntu (22.04)
ubuntu-oldlts: Ubuntu (20.04)
void: Void Linux"

echo ;echo "Type the name of distro."
read -p "> " choiceproot
echo && echo "Wait..";sleep 6
proot-distro install "$choiceproot"
clear;echo "Type proot-distro login '$choiceproot'";echo 
echo "GSA Inteligency ;)..."

else
	echo && echo "Incorrect, Re-Open Script.. | SKIP"
fi