#!/bin/bash
cd `dirname $0`
echo "Trying to operate on device specified in nvmt.fid: "
cat nvmt.fid
chmod a+x ./nvmt
./nvmt
./nvmt p|grep -i nvidia
./nvmt gputemp
./nvmt mc
./nvmt ac
./nvmt mc5
./nvmt i
#./nvmt calstatus
./nvmt trainstatus
./nvmt cmdmap
