#!/bin/bash
cd `dirname $0`
echo "Trying to operate on device specified in nvmt.fid: "
cat nvmt.fid
./nvmt
./nvmt p|grep -i nvidia
./nvmt gputemp
./nvmt mc
./nvmt ac
./nvmt trainstatus
./nvmt mc5
./nvmt i
./nvmt calstatus
./nvmt cmdmap
#./nvmt shmoocfg
