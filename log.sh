#!/bin/bash
LOG_ROOT="$I2000_HOME/I2000/run/log"
showAll(){
	echo "test /Users/phan/cmdTools/hideFiles.sh"
	echo "root.log ${LOG_ROOT}/root.log "
	echo "fm.log ${LOG_ROOT}/oms/fm/fm.log"
	echo "probe.log ${LOG_ROOT}/i2000/fm/momgr.fm.porbe.log"
}
main(){
	if [ X$1 == "X--help" ]; then
		echo "log [logFileName] [showType]"
		echo "logFileName :root/fm/probe...."
		echo "showType :head/tail/tailf...."
		exit 0;
	fi
	#if [ X$1 == "Xroot" ]; then
	#	echo "root.log ${LOG_ROOT}/root.log "
	#	exit 0;
	#fi
	
	targetLogs=`showAll |grep "^$1" `
	if [[ X$1 != "X" && X$2 != "X" ]]; then
		action=$2
		log=`echo "$targetLogs"|awk '{print $2}'`
		if [[ X${action} == "Xvi" || X${action} == "Xvim" ]]; then
			echo "not support auto run vi,please run vi by yourself"
			echo  "$log" 
		else
			echo `$action $log`
		fi
		
	else
		echo "$targetLogs"
    fi
	
}
main $@
