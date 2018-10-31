#!/bin/bash
LOG_ROOT="$I2000_HOME/I2000/run/log"
showAll(){
	
	echo "root.log ${LOG_ROOT}/root.log "
	echo "fm.log ${LOG_ROOT}/oms/fm/fm.log"
	echo "probe.log ${LOG_ROOT}/i2000/fm/momgr.porbe.log"
}
main(){
	if [ X$1 == "X--help" ]; then
		echo "log [logFileName] [showType]"
		echo "logFileName :root/fm/probe...."
		echo "showType :head/tail/tailf...."
		exit 0;
	fi
	if [ X$1 == "Xroot" ]; then
		echo "root.log ${LOG_ROOT}/root.log "
		exit 0;
	fi
	showAll
}
main $@
