#!/usr/bin/expect

set server_url [lindex $argv 0]  
set username [lindex $argv 1]  
set passwd [lindex $argv 2]  
set key [lindex $argv 3]

#server_url=$1


#username=$2

#passwd=$3



#echo "using user: ${username}  to login: ${server_url}"



set timeout 30
if { ${key} != ""} {
	spawn ssh ${username}@${server_url} -i ${key}
} else {
	spawn ssh ${username}@${server_url}

	expect {
	 "*yes/no" { send "yes\r"; exp_continue }
	 "*password:" { send "${passwd}\r" }
	 }
} 


expect "*"
set timeout 30
send "cd ~\r"
expect "*"
#echo "backup classpath"

set classpath "~/resource/webapps/ROOT/WEB-INF/classes"

set timeout 30
send "cd ${classpath}\r"
#date=date +%y%m%d
set timeout 30
send "tar -cvf ../classes.tar ./\r"
expect "*"
set timeout -1
send "echo backup finish\r exit\r"
expect eof
