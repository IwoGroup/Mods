#!/bin/bash
chmod a+x ./mt-out.sh ./mt.sh
rm -f mt.log
if [[ -e mt.log ]]
then
	echo "Failed removing old log. Run './mt-out.sh' too see output without logging"
else
(
	echo "Saving log to mt.log"
	./mt-out.sh >mt.log 2>&1
	cat mt.log
	echo "Completed. Full nvmt log saved to mt.log"
	echo "Use commands 'less mt.log' or 'more mt.log' or 'nano mt.log' to scroll it"
)
fi
