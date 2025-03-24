#!/bin/bash

wykonaj_testowo() {
	folder_mods="466.107-3060-3070ti"
	seria="Seria 3000: GA104 (3060, 3060 Ti, 3070, 3070 Ti)"
	folder_nvmt="nvmt34"			
	wykonaj_usun
	clear
	echo "$seria"
	sleep 1
	cd $folder_mods
	sleep 1
	./mods gputest.js -oqa -test 94 -dramclk_percent 100
	sleep 1
	cd ..
	cd $folder_nvmt
	./mt.sh
	sleep 1
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mt.log
	sleep 1
	cd ..
	cd $folder_mods
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mods.log
	sleep 1
	poweroff
}

wykonaj_usun() { #usuwa logi w danum folderze
	clear
	rm *.txt *.log
	clear
	echo "usuwanie..."
	sleep 0.5
}

wykonaj_menu_test() {
while true; do
clear
echo "$seria"
echo " "
echo "Wybierz Test:"
echo "1. Mods & Mats"
echo "2. Mods"
echo "3. Test 94"
echo "4. Test 178 memory stress test (wymaga pci 16x)"
echo "=========================================="
echo "5. Test 123 - do dopracowania"
echo "6. Test 108 - do dopracowania"
echo "7. Test 2 - do dopracowania"
echo "8. Test 295 - do dopracowania"
echo "9. Test niemca - do dopracowania"
echo "10. Test chinczyka - do dopracowania"
echo "11. yo"
echo " "
echo "q. Back"
echo "w. Power off"
echo "e. Exit"
read choice
case $choice in
	1)
		wykonaj_mads
		sleep 1
		;;
	2)
		wykonaj_mods
		sleep 1
		;;
	3)
		wykonaj_test94
		sleep 1
		cd ..
		;;
	4)
		wykonaj_test178
		sleep 1
		cd ..
		;;
	5)
		wykonaj_test123
		sleep 1
		cd ..
		;;
	6)
		wykonaj_test108
		sleep 1
		cd ..
		;;
	7)
		wykonaj_test2
		sleep 1
		cd ..
		;;
	8)
		wykonaj_test295
		sleep 1
		cd ..
		;;
	9)
		wykonaj_test_niemca
		sleep 1
		cd ..
		;;
	10)
		wykonaj_test_chinczyka
		sleep 1
		cd ..
		;;
	11)
		yo
		sleep 1
		cd ..
		;;
	q)
		break
		;;
	w)
		poweroff
		;;
	e)
		Exit
		;;
	*)
		if declare -f "$choice" > /dev/null 2>&1; 
			then
			echo "Wywoluje funkcje: $choice"
			sleep 1
			$choice
			else
			echo "Nie znaleziono funkcji o nazwie: $choice"
			sleep 1
		fi
		;;
	esac
done
}

wykonaj_mads() {
	wykonaj_usun
	clear
	echo "$seria"
	sleep 1
	cd $folder_mods
	sleep 1
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 1
	./mats -n 1 -e 5
	sleep 1
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 1
	rm report.txt
	cd ..
	cd $folder_nvmt
	./mt.sh
	sleep 1
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mt.log
	sleep 1
	cd ..
	cd $folder_mods
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mods.log
	sleep 1
	poweroff
}

wykonaj_mods() {
	wykonaj_usun #usuwa logi z folderu home
	clear
	echo "$seria"
	sleep 1
	cd $folder_mods
	sleep 1
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 1
	cp -r mods.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	cd ..
	cd $folder_nvmt
	./mt.sh
	sleep 1
	cp -r mt.log ../mt_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mt.log
	sleep 1
	cd ..
	cd $folder_mods
	sleep 1
	rm mods.log
	sleep 1
	poweroff
}

wykonaj_5090() { #brak
	wykonaj_usun
	clear
	echo "no jeszcze tego nie ma :("
	sleep 1
}

wykonaj_przypominajka() {
	clear
	sleep 0.5
	echo "zapominajka"
	echo "cd 520.175-4060ti-4080"
	echo "./mods gputest.js -skip_rm_state_init -oqa"
	echo "./mats -n 1 -e 5"
	echo "cd nvmt34"
	echo "./mt.sh"
	echo "cp -r mt.log ../mods_4060ti_4070_4070Ti_4080.log"
	echo "nieaktualne :("
}

wykonaj_test2() {
	clear
	cd "$folder_mods"
	sleep 0.5
	./mods gputest.js -oqa -test 2
	sleep 0.5
	less mods.log
}

wykonaj_test94() {
	clear
	cd "$folder_mods"
	pwd
	sleep 3.5
	./mods gputest.js -oqa -test 94 -dramclk_percent 100
	sleep 3.5
	less mods.log
}

wykonaj_test178() {
	clear
	cd "$folder_mods"
	sleep 0.5
	./mods gputest.js -oqa -test 178 -dramclk_percent 100
	sleep 0.5
	less mods.log
}

wykonaj_test108() {
	clear
	cd "$folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 108 -dramclk_percent 100
	sleep 0.5
	less mods.log
}

wykonaj_test123() {
	clear
	cd "$folder_mods"
	sleep 0.5
	./mods gputest.js -oqa -test 123 -dramclk_percent 100
	sleep 0.5
	less mods.log
}

wykonaj_test295() {
	clear
	cd "$folder_mods"
	sleep 0.5
	./mods gputest.js -oqa -test 295 -dramclk_percent 100
	sleep 0.5
	less mods.log
}

wykonaj_test_niemca() {
	clear
	cd "$folder_mods"
	sleep 0.5
	./mods gputest.js -oqa -dramclk_percent 100 -matsinfo -poll_interrupts -rmkey RmPmgrPwrTopology2xSupport 1 -rmkey RmPmgrPwrPolicy3xSupport 1 -rmkey RmPmgrPwrPolicy3xLimitScale 100 -skip 147
	sleep 0.5
	less mods.log
}

wykonaj_test_chinczyka() {
	clear
	cd "$folder_mods"
	sleep 0.5
	./mods gputest.js -oqa -dramclk_percent 100 -test 242 -test 19 -test 166 loops 5 -dramclk +1pct
	sleep 0.5
	less mods.log
}

yo() {
	clear
	echo "yoyoyoyoyo"
	sleep 5.5
}

NO_FORMAT="\033[0m"
C_GREY0="\033[38;5;16m"
C_GREEN="\033[48;5;2m"
C_RED1="\033[48;5;196m"
C_DODGERBLUE1="\033[48;5;33m"
C_SILVER="\033[48;5;7m"

clear
cat logo_color
sleep 1
while true; do
	clear
	cat logo
	echo "Wybierz:"
	echo -e "1. ${C_GREY0}${C_GREEN}               Nvidia              ${NO_FORMAT}"
	echo -e "2. ${C_GREY0}${C_RED1}                AMD                ${NO_FORMAT}"
	echo -e "3. ${C_GREY0}${C_DODGERBLUE1}               Intel               ${NO_FORMAT}"
	echo "   -----------------------------------"
	echo -e "7. ${C_GREY0}${C_SILVER}                Inne               ${NO_FORMAT}"
	echo -e "8. ${C_GREY0}${C_SILVER}              Usun logi            ${NO_FORMAT}"
	echo "q.                Quit w.          "
	read choice
	case $choice in
	1) #menu Nvidia)
		while true; do
			clear
			cat Nvidia
			echo " "
			echo "Wybierz:"
			echo "1. Seria 1000"
			echo "2. Seria 2000"
			echo "3. Seria 3000"
			echo "4. Seria 4000"
			echo "5. Seria 5000"
			echo "q. Back"
			read choice
			case $choice in
				1) #seria 1)
					folder_mods="367.56-10xx"
					seria="Seria 1000 GP102, GP104, GP106, GP107, GP108"	
					folder_nvmt="nvmt1"	
					wykonaj_menu_test
					;;
				2) #seria 2)
					folder_mods="400.281-20xx"
					seria="Seria 2000: TU102, TU104, TU106, TU116, TU117"
					folder_nvmt="nvmt2"
					wykonaj_menu_test
					;;
				3) #seria 3)
					while true; do
					clear
					cat Nvidia
					echo " "
					echo "Seria 3000"
					echo " "
					echo "Wybierz:"
					echo "1. GA102 (3080, 3090, 3090 Ti)"
					echo "2. GA104 (3060, 3060 Ti, 3070, 3070 Ti)"
					echo "q. Back"
					read choice
					case $choice in
						1) #GA102)
							folder_mods="488.219-3080-3090"
							seria="Seria 3000: GA102 (3080, 3090, 3090 Ti)"	
							folder_nvmt="nvmt34"			
							wykonaj_menu_test
							;;
						2) #GA104)
							folder_mods="466.107-3060-3070ti"
							seria="Seria 3000: GA104 (3060, 3060 Ti, 3070, 3070 Ti)"	
							folder_nvmt="nvmt34"					
							wykonaj_menu_test
							;;
						q) 
							break
							;;
						w)
							poweroff
							;;
						*)
							clear
							echo "Nope"
							sleep 0.5
							;;
					esac
					done
					;;
				4) #seria 4)
					while true; do
					clear
					cat Nvidia
					echo " "
					echo "Seria 4000"
					echo " "
					echo "Wybierz:"
					echo "1. AD102 AD104 (4060 Ti, 4070, 4070 Ti, 4080, 4090)"
					echo "2. AD103 (4070 Super Ti)"
					echo "q. Back"
					read choice
					case $choice in
						1)
							folder_mods="520.175-4060ti-4080"
							seria="Seria 4000: AD102 AD104 (4060 Ti, 4070, 4070 Ti, 4080, 4090)"
							folder_nvmt="nvmt34"
							wykonaj_menu_test
							;;
						2)
							folder_mods="520.249-AD103"
							seria="Seria 4000: AD103 (4070 Super Ti)"
							folder_nvmt="nvmt34"
							wykonaj_menu_test
							;;
						q) 
							break
							;;
						w)
							poweroff
							;;
						*)
							clear
							echo "Nope"
							sleep 0.5
							;;
					esac
					done	
					;;
				5) #seria 5 wykonaj_5090)
					clear
					echo "Brak. kick za: 3"
					sleep 1
					echo "Brak. kick za: 2"
					sleep 1
					echo "Brak. kick za: 1"
					sleep 1
					;;
				q) 
					break
					;;	
				w)
					poweroff
					;;									
				*)
					clear
					echo "Nope"
					sleep 0.3
					;;
		esac
		done
		;;
	2) # menu AMD)
#		while true; do
				clear
				echo "       d8888 888b     d888 8888888b.  "
				echo "      d88888 8888b   d8888 888  'Y88b "
				echo "     d88P888 88888b.d88888 888    888 "
				echo "    d88P 888 888Y88888P888 888    888 "
				echo "   d88P  888 888 Y888P 888 888    888 "
				echo "  d88P   888 888  Y8P  888 888    888 "
				echo " d8888888888 888   '   888 888  .d88P "
				echo "d88P     888 888       888 8888888P'  "            
				echo " "   
				echo "Brak. kick za: 3"
				sleep 1
				echo "Brak. kick za: 2"
				sleep 1
				echo "Brak. kick za: 1"
				sleep 1
#				echo "Wybierz:"
#				echo "1. Seria 5000"
#				echo "2. Seria 6000"
#				echo "3. Seria 7000"
#				echo "4. Seria 9000"
#				echo "q. Back"
#				read choice
#				case $choice in
#				1) #seria 1)
#					clear
#					echo "Brak"
#					sleep 1
#					;;
#				2) #seria 2)
#					clear
#					echo "Brak"
#					sleep 1
#					;;
#				3) #seria 3)
#					clear
#					echo "Brak"
#					sleep 1
#					;;
#				4) #seria 4)
#					clear
#					echo "Brak"
#					sleep 1
#					;;
#				q) 
#					break
#					;;										
#				*)
#					clear
#					echo "Nope"
#					sleep 0.3
#			esac
#		done	
		;;
	3) # menu Intel)
			clear
			echo "8888888          888            888 "
			echo "  888            888            888 "
			echo "  888            888            888 "
			echo "  888   88888b.  888888 .d88b.  888 "
			echo "  888   888 '88b 888   d8P  Y8b 888 "
			echo "  888   888  888 888   88888888 888 "
			echo "  888   888  888 Y88b. Y8b.     888 "
			echo "8888888 888  888  'Y888 'Y8888  888 "
			echo " "
			echo "Brak. kick za: 3"
			sleep 1
			echo "Brak. kick za: 2"
			sleep 1
			echo "Brak. kick za: 1"
			sleep 1
		;;
	7) # tu dodaj menu innych)
		while true; do
		clear
		echo "Wybierz:"
		echo "1. Release"
		echo "2. Opcja testowa (nie wem co tam jest)"
		echo "3. Przypominajka"
		echo "4. Snake"
		echo "5. Manual"
		echo "6. Szukanie"
		echo "7. Bad Apple"		
		echo "q. Quit"
		echo "w. Poweroff"
		echo "e. Exit"
		read choice
			case $choice in
				1)
					clear
					less Release
					;;
				2)
					wykonaj_test				
					;;
				3)
					clear
					wykonaj_przypominajka
					break
					;;
				4)
					clear
					./snake				
					;;
				5)
					less manual
					;;
				6)
					szukanie
					;;
				7)
					cd bad
					./run.sh
					sleep 0.5
					cd /home
					;;
				q)
					clear
					break
					;;
				w)
					clear
					poweroff
					;;
				e)
					clear
					Exit
					;;
				*)
					clear
					echo "Nope"
					sleep 0.5
				;;
			esac
		done
		;;
	8)
		clear
		wykonaj_usun
		cd 367.56-10xx
		wykonaj_usun
		cd ..
		cd 400.281-20xx
		wykonaj_usun
		cd ..
		cd 466.107-3060-3070ti
		wykonaj_usun
		cd ..
		cd 488.219-3080-3090
		wykonaj_usun
		cd ..
		cd 520.175-4060ti-4080
		wykonaj_usun
		cd ..
		cd 520.249-AD103
		wykonaj_usun
		cd ..
		;;
	q)
		clear
		echo "Zamykanie programu..."
		break
		;;
	w)
		clear
		poweroff
		;;
	e)
		clear
		Exit
		;;
	*)
		clear
		echo "Nope"
		sleep 0.3
		;;
	esac
done