#!/usr/bin/expect
spawn ssh weblib@202.38.194.106
expect "*password:"
send "weblib@2016\r"
expect "*#"
interact