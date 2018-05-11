#!/usr/bin/expect

set host [lindex $argv 0]
set user [lindex $argv 1]
set passwd [lindex $argv 2]
set src [lindex $argv 3]
set dest [lindex $argv 4]
set isfolder [lindex $argv 5]
set key [lindex $argv 6]

set timeout 300


#判断src 是单个文件还是文件夹
if {  ${isfolder} == "true" } {
	spawn	scp -i ${key} -r  ${src} ${user}@${host}:${dest}
} else { 
    	spawn   scp -i ${key} ${src} ${user}@${host}:${dest}
} 

if {  ${key} == "" } {
			expect {  
		 "(yes/no)?"  
		   {  
		    send "yes\n"  
		    expect "*assword:" { send "${passwd}\n" ; exp_continue }  
		 }  
		 "*assword:"  
		{  
		 send "${passwd}\n" ; exp_continue 
		}  
			"100%"
			{
				send "echo scp finish\r exit\r"
			}
		}  
} else { 
 expect {  
 
	"100%"
	{
		send "echo scp finish\r exit\r"
	}
}  
} 

# expect "100%"  
# send "echo scp finish\r exit\r"
expect eof  







