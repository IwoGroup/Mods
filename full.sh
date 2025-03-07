#!/bin/bash

testowo() {
	clear
	sleep 1
	echo "testowe"
	sleep 1
	cd 520.175-testowe
	sleep 1
	./mods gputest.js -oqa -skip_rm_state_init
	sleep 1
	./mats -n 1 -e 5
	sleep 1
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sync
	rm report.txt
	cd ..
	cd nvmt34
	./mt.sh
	sleep 1
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 1
	rm mt.log
	sleep 0.5
	cd ..
	cd 520.175-testowe
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_usun() {
	clear
	rm *.txt *.log
	clear
	echo "usuwanie..."
	sleep 0.5
}

wykonaj_1000() {
	wykonaj_usun
	clear
	echo "Wybrano serie 1000"
	sleep 0.5
	cd 455.127-10x-20xx
	sleep 0.5
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 0.5
	./mats -n 1 -e 5
	sleep 0.5
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 0.5
	rm report.txt
	cd ..
	cd nvmt1
	./mt.sh
	sleep 0.5
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mt.log
	sleep 0.5
	cd ..
	cd 455.127-10x-20xx
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_2000() {
	wykonaj_usun
	clear
	echo "Wybrano serie 2000"
	sleep 0.5
	cd 455.127-10x-20xx
	sleep 0.5
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 0.5
	./mats -n 1 -e 5
	sleep 0.5
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 0.5
	rm report.txt
	cd ..
	cd nvmt2
	./mt.sh
	sleep 0.5
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mt.log
	sleep 0.5
	cd ..
	cd 455.127-10x-20xx
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_3060() {
	wykonaj_usun
	clear
	echo "Wybrano 3060; 3070; 3070 Ti"
	sleep 0.5
	cd 466.107-3060-3070ti
	sleep 0.5
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 0.5
	./mats -n 1 -e 5
	sleep 0.5
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 0.5
	rm report.txt
	cd ..
	cd nvmt34
	./mt.sh
	sleep 0.5
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mt.log
	sleep 0.5
	cd ..
	cd 466.107-3060-3070ti
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_3080() {
	wykonaj_usun
	clear
	echo "Wybrano 3080; 3090"
	sleep 0.5
	cd 488.219-3080-3090
	sleep 0.5
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 0.5
	./mats -n 1 -e 5
	sleep 0.5
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 0.5
	rm report.txt
	cd ..
	cd nvmt34
	./mt.sh
	sleep 0.5
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mt.log
	sleep 0.5
	cd ..
	cd 488.219-3080-3090
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_4060() {
	wykonaj_usun
	clear
	echo "Wybrano AD104 - 4060 Ti; 4070; 4070 Ti; 4080"
	sleep 0.5
	cd 520.175-4060ti-4080
	sleep 0.5
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 0.5
	./mats -n 1 -e 5
	sleep 0.5
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 0.5
	rm report.txt
	cd ..
	cd nvmt34
	./mt.sh
	sleep 0.5
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mt.log
	sleep 0.5
	cd ..
	cd 520.175-4060ti-4080
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_AD103() {
	wykonaj_usun
	clear
	echo "Wybrano AD103 - 4070; 4070 Ti Super; 4080 Super; 4080"
	sleep 0.5
	cd 520.249-AD103
	sleep 0.5
	./mods gputest.js -skip_rm_state_init -oqa
	sleep 0.5
	./mats -n 1 -e 5
	sleep 0.5
	cp -r report.txt ../mats_$(date +%Y-%m-%d_%H-%M-%S).txt
	sleep 0.5
	rm report.txt
	cd ..
	cd nvmt34
	./mt.sh
	sleep 0.5
	cp -r mt.log ../mods_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mt.log
	sleep 0.5
	cd ..
	cd 520.249-AD103
	cp -r mods.log ../mods2_$(date +%Y-%m-%d_%H-%M-%S).log
	sleep 0.5
	rm mods.log
	sleep 0.5
	poweroff
}

wykonaj_5090() {
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

clear
cat logo_color
sleep 2
while true; do
	clear
	cat logo
	echo "Wybierz opcje:"
	echo "1. Seria 1000 ::: GP102, GP104, GP106, GP107, GP108"
	echo "2. Seria 2000 ::: TU102, TU104, TU106, TU10116, TU117"
	echo "3. Seria 3000 ::: GA104, GA102"
	echo "4. Seria 4000 ::: AD104, AD103"
	echo "5. Seria 5000 ::: GB202 - *** kiedys ***"
	echo "6. Usun logi"
	echo "7. Lista komend"
	echo "9. Quit w"
	read choice
	case $choice in
	1)
		wykonaj_1000
		;;
	2)
		wykonaj_2000
		;;
        3)
		while true; do
			clear
			cat logo
			echo "Wybierz opcje:"
			echo "1. ::: GA104 - (3060, 3060Ti, 3070, 3070Ti)"
			echo "2. ::: GA102 - (3080, 3090, 3090Ti)"
			echo "3. Powrot"
			read choice
			case $choice in
				1)
					wykonaj_3060
					;;
				2)
					wykonaj_3080
					;;
				3)
					break
					;;
				*)
					clear
					echo "Nieprawidlowy wybor, sproboj ponownie."
					sleep 1
					;;
			esac
			done
		;;
        4)
		while true; do
			clear
			cat logo
			echo "Wybierz opcje:"
			echo "1. ::: AD104 - (4060Ti; 4070; 4070Ti; 4080)"
			echo "2. ::: AD103 - (4070; 4070 Ti Super; 4080 Super; 4080)"
			echo "3. Powrot"
			read choice
			case $choice in
				1)
					wykonaj_4060
					;;
				2)
					wykonaj_AD103
					;;
				3)
					break
					;;
				*)
					clear
					echo "Nieprawidlowy wybor, sproboj ponownie."
					sleep 1
					;;
			esac
			done
		;;
	5)
		wykonaj_5090
		;;
	6)
		wykonaj_usun
		;;
	7)
		clear
		echo "lista wszystkich opcji:"
		echo "1. Test Seria 1000"
		echo "2. Test Seria 2000"
		echo "3. Test Seria 3000"
		echo "4. Test Seria 4000"
		echo "5. Test Seria 5000"
		echo "6. Usun logi"
		echo "7. Komendy"
		echo "9. Quit"
		echo "10. Release"
		echo "11. Snake"
		echo "12. Opcja testowa - zmienna"
		echo "13. Przypominajka"
		echo "14. Poweroff"
		break
		;;
	9)
		clear
		echo "Zamykanie programu..."
		break
		;;
	10)
		clear
		less Release
		;;
	11)
		clear
		./snake
		;;
        12)
		testowo
		;;
	13)
		clear
		wykonaj_przypominajka
		break
	;;
	14)
		poweroff
	;;
	*)
		clear
		echo "Nieprawidlowy wybor, sproboj ponownie."
		sleep 0.5
	;;
	esac
done