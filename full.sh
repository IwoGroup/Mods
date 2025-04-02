./#!/bin/bash

wykonaj_testowo() {
	clear
	cd "$folder_mods"
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 1 -test 2 -test 3 -test 4 -test 5 -test 6 -test 7 -test 8 -test 9 -test 10
	sleep 0.5
	cp -r mods.log ../test3_$(date +%Y-%m-%d_%H-%M-%S).log
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}

wykonaj_usun() { #usuwa logi w danym folderze
	clear
	rm *.txt *.log
	clear
	echo "usuwanie..."
	sleep 0.5
}

wykonaj_usun_log() { #usuwa log modsa
	sleep 0.5
	rm mods.log
	clear
	echo "kopia raportu jest w folderze home"
	sleep 0.5
	echo "3"
	sleep 0.5
	echo "2"
	sleep 0.5
	echo "1"
	sleep 0.5
}

wykonaj_menu_test() {
while true; do
clear
echo " "
echo "$seria" ##seria jest ustawiana przy wyborze odpowiedniej karty w menu
echo " "
echo "Wybierz Test:"
echo "1. Mods & Mats + Power Off"
echo "2. Mods + Power Off"
echo "3. Mats gpu 2 + Power Off"
echo "   -------- wymaga obrazu z testowanego gpu --------"
echo "4. Mats"
echo "5. Test 2 - GLStress - ok 20s"
echo "pl. Test 3 - MatsTest - ok 20s"
echo "12. Test niczego - ..."
echo "94. Test 94 - NewWfMats - ok 30s"
echo "123. Test 123 - NewWfMatsBus - ok 30s"
echo "178. Test 178 - WfMatsBgStress - stress test - ok 100s"
echo "999. Testowo"
echo "yo"
echo " "
echo "q. Back"
echo "w. Power off"
echo "e. Exit"
read choice
case $choice in
	1)
		wykonaj_mods_mats
		;;
	2)
		wykonaj_mods
		;;
	3)
		wykonaj_mats_n1
		;;
	4)
		wykonaj_mats
		cd ..
		;;
	5)
		wykonaj_test2
		cd ..
		;;
	pl)
		wykonaj_test3
		cd ..
		;;
	12)
		wykonaj_test_nic
		cd ..
		;;	
	94)
		wykonaj_test94
		cd ..
		;;
	123)
		wykonaj_test123
		cd ..
		;;
	178)
		wykonaj_test178
		cd ..
		;;
	999)
		wykonaj_testowo
		cd ..
		;;
	yo)
		yo
		sleep 1
		;;
	q)
		break
		;;
	w)
		poweroff
		;;
	e)
		exit
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

wykonaj_mods_mats() {
	wykonaj_usun #usuwa logi z folderu - home w tym przypadku
	clear
	echo "$seria"
	sleep 1
	cd $folder_mods
	sleep 1
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 1
	/home/tetris.sh
	./mats -n 1 -e 5
	sleep 1
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 1
	rm report.txt
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
	cp -r mods.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mods.log
	sleep 1
	poweroff
}

wykonaj_mods() {
	wykonaj_usun #usuwa logi z folderu - home w tym przypadku
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

wykonaj_mats_n1() {
	wykonaj_usun #usuwa logi z folderu - home w tym przypadku
	clear
	echo "$seria"
	sleep 1
	cd $folder_mods
	sleep 1
	./mats -n 1 -e 5
	sleep 1
	cp -r report.txt ../mats_n1_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 1
	rm report.txt
	sleep 1
	poweroff
}
wykonaj_mats() {
	#wykonaj_usun #usuwa logi z folderu - home w tym przypadku
	clear
	echo "$seria"
	sleep 1
	cd $folder_mods
	sleep 1
	./mats -e 5
	sleep 1
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 1
	clear
	sleep 0.5
	less report.txt
	sleep 0.5
	rm report.txt
	clear
	echo "kopia raportu jest w folderze home"
	sleep 0.5
	echo "3"
	sleep 0.5
	echo "2"
	sleep 0.5
	echo "1"
	sleep 0.5
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
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 2 -dramclk_percent 100 -loops 5
	sleep 0.5
	cp -r mods.log ../test2_$(date +%Y-%m-%d_%H-%M-%S).log
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}


wykonaj_test3() {
	clear
	cd "$folder_mods"
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 3 -dramclk_percent 100
	sleep 0.5
	cp -r mods.log ../test3_$(date +%Y-%m-%d_%H-%M-%S).log
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}

wykonaj_test94() {
	clear
	cd "$folder_mods"
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 94 -dramclk_percent 100
	sleep 0.5
	cp -r mods.log ../test94_$(date +%Y-%m-%d_%H-%M-%S).log
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}

wykonaj_test123() {
	clear
	cd "$folder_mods"
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 123 -dramclk_percent 100 -loops 2
	sleep 0.5
	cp -r mods.log ../test123_$(date +%Y-%m-%d_%H-%M-%S).log
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}

wykonaj_test178() {
	clear
	cd "$folder_mods"
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -oqa -test 178 -dramclk_percent 100
	sleep 0.5
	cp -r mods.log ../test178_$(date +%Y-%m-%d_%H-%M-%S).log
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}

wykonaj_test_nic() {
	clear
	cd "$folder_mods"
	clear
	echo "seria: $seria"
	echo "folder: $folder_mods"
	sleep 1
	./mods gputest.js -timeout_ms 60000 -print_enter_code -run_on_error -clk_mhz dram +2.pct,0.all -clk_mhz dram +2.pct,3.all -vfe_var_range fuse 4 1 1 -vfe_var_range fuse 5 1 1 -enable_override_ovoc -check_linkwidth 0 16 16 -check_linkspeed 0 8000,16000 -print_inforom_remapped_rows -max_per_bank_remapped_rows 2 -max_total_remapped_rows 32 -freq_clk_domain_offset_khz gpc 30000 -skip 78 -bg_int_temp 5000 -bg_power 5000 -dump_stats -testarg 350 Verbose true -dev all -memtmp_range_time 30 74 1000 -test 632,0.max -fan_speed 63,63 -bg_fan 1000 -bg_dram_temp 1000 -bg_int_temp 1000
	sleep 0.5
	cp -r mods.log ../test_nic_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	less mods.log
	wykonaj_usun_log ## usuwa logi z tego folderu
}

yo() {
	clear
	echo "yoyoyoyoyo"
	sleep 3
}

NO_FORMAT="\033[0m"
C_GREY0="\033[38;5;16m"
C_GREEN="\033[48;5;2m"
C_RED1="\033[48;5;196m"
C_DODGERBLUE1="\033[48;5;33m"
C_SILVER="\033[48;5;7m"
C_Z="\033[48;5;45m"

clear
cat logo_color
sleep 1
while true; do
	clear
	cat logo
	echo "Wybierz:"
	echo -e "1. ${C_GREY0}${C_GREEN}               Nvidia              ${NO_FORMAT}"
	echo " "
	echo -e "2. ${C_GREY0}${C_RED1}                AMD                ${NO_FORMAT}"
	echo " "
	echo -e "3. ${C_GREY0}${C_Z}               Intel               ${NO_FORMAT}"
	echo "   -----------------------------------"
	echo -e "7. ${C_GREY0}${C_SILVER}                Inne               ${NO_FORMAT}"
	echo " "
	echo -e "8. ${C_GREY0}${C_SILVER}              Usun logi            ${NO_FORMAT}"
	echo " "
	echo "q.                 Quit w          "
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
			echo "w. Power Off"
			echo "e. Exit"
			read choice
			case $choice in
				1) #seria 1)
					folder_mods="367.56-10xx"
					seria="Seria 1000: GP102, GP104, GP106, GP107, GP108"	
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
					echo "w. Power Off"
					echo "e. Exit"
					read choice
					case $choice in
						1) #GA102)
							folder_mods="488.219-3080-3090"
							seria="Seria 3000: GA102 - (3080, 3090, 3090 Ti)"	
							folder_nvmt="nvmt34"			
							wykonaj_menu_test
							;;
						2) #GA104)
							folder_mods="466.107-3060-3070ti"
							seria="Seria 3000: GA104 - (3060, 3060 Ti, 3070, 3070 Ti)"	
							folder_nvmt="nvmt34"					
							wykonaj_menu_test
							;;
						q) 
							break
							;;
						w)
							poweroff
							;;
						e)
							exit
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
					echo "w. Power Off"
					echo "e. Exit"
					read choice
					case $choice in
						1)
							folder_mods="520.175-4060ti-4080"
							seria="Seria 4000: AD102 AD104 - (4060 Ti, 4070, 4070 Ti, 4080, 4090)"
							folder_nvmt="nvmt34"
							wykonaj_menu_test
							;;
						2)
							folder_mods="520.249-AD103"
							seria="Seria 4000: AD103 - (4070 Super Ti)"
							folder_nvmt="nvmt34"
							wykonaj_menu_test
							;;
						q) 
							break
							;;
						w)
							poweroff
							;;
						e)
							exit
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
				e)
					exit
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
				cat Radeon
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
			cat Intel
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
					exit
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
		exit
		;;
	*)
		clear
		echo "Nope"
		sleep 0.3
		;;
	esac
done