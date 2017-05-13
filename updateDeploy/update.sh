#!/bin/bash

serverName=$1
case ${serverName} in
    "scn")  
		echo '你选择了 scn'
		#读取配置参数
		source ./scn.properties
    ;;
    "ccnl")  echo '你选择了 2'
    ;;
    "cerpart")  echo '你选择了 3'
    ;;
    "cernet")  echo '你选择了 4'
    ;;
    "247")  
		echo '你选择了 247'
		#读取配置参数
		source ./247.properties
    ;;
    *)  echo '未选更新哪个服务器'
		exit 0
    ;;
esac






# #是否备份原来的classpath
# read -p "need backup classpath? y/n :"  backup

# if [ ${backup} == "y" ]
# then
# 	echo "start backup"
# 	if [[ ${key} != "" ]]; then
# 		./backup.sh $host $user "" $key
# 	else
# 		./backup.sh $host $user $passwd
# 	fi
  	
#   	echo "return from  backup=================================================="
# fi
if [[ $passwd == "" ]]; then
	echo "nopasswd"
	passwd="nopasswd"
fi

#更新com文件夹下所有内容
read -p "replace the whole com folder? y/n " replace_com

if [  ${replace_com} == "y"  ]
then
	echo "com src:   ${com_src_path}"
	echo "com dist:  ${com_dest_path}"

	if [   -d ${com_src_path} ]
	then
        	./scp.sh $host $user $passwd $com_src_path $com_dest_path true ${key}
	elif [  -f ${com_src_path} ]
	then
        	./scp.sh $host $user $passwd $com_src_path $com_dest_path false ${key}
	else
    		echo "ERROR! 源文件\目录不存在"
	fi

	
	echo "return from com folder replace=================================================="
fi

#替换更新applicationContext.xml 文件
read -p "replace the applicationContext.xml? y/n " replace_appxml

if [  ${replace_appxml} == "y"  ]
then
	echo "xml src:   ${appcontext_src_path}"
	echo "xml dist:  ${appcontext_dest_path}"

	if [   -d ${appcontext_src_path} ]
	then
        	./scp.sh $host $user $passwd $appcontext_src_path $appcontext_dest_path true ${key}
	elif [  -f ${appcontext_src_path} ]
	then
        	./scp.sh $host $user $passwd $appcontext_src_path $appcontext_dest_path false ${key}
	else
    		echo "ERROR! 源文件\目录不存在"
	fi

	
	echo "return from applicationContext.xml replace=================================================="
fi


#替换更新groups.properties文件
read -p "replace the groups.properties? y/n " replace_prop

if [  ${replace_prop} == "y"  ]
then
	echo "xml src:   ${prop_src_path}"
	echo "xml dist:  ${prop_dest_path}"

	if [   -d ${prop_src_path} ]
	then
        	./scp.sh $host $user $passwd $prop_src_path $prop_dest_path true ${key}
	elif [  -f ${prop_src_path} ]
	then
        	./scp.sh $host $user $passwd $prop_src_path $prop_dest_path false ${key}
	else
    		echo "ERROR! 源文件\目录不存在"
	fi

	
	echo "return from groups.properties replace=================================================="
fi

echo "更新完成，其余部分请手动更新"
