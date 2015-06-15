#!/bin/bash
ip=`/sbin/ifconfig eth0|grep "inet addr"|awk -F ":" '{print $2}'|awk '{print $1}'`
current_date=`date +%Y-%m-%d-%H:%M:%S`
dis_manumenu="<ip:${ip}-server>"
user=`echo $USER`
# Source function library.
. /etc/rc.d/init.d/functions
new_echo () {
	if [ -z "$2" ]
	then
		COLOR=33
	elif [ $2 == red ]
	then
		COLOR=31
	elif [ $2 == green ]
	then
		COLOR=32
	elif [ $2 == blue ]
	then
		COLOR=36
	elif [ $2 == purple ]
	then
		COLOR=35
	elif [ $2 == white ]
	then
		COLOR=39
	else
		echo new_echo function use error
		exit
	fi
	if [ -z "$4" ]
	then
		COLOR1=33
	elif [ $4 == red ]
	then
		COLOR1=31
	elif [ $4 == green ]
	then
		COLOR1=32
	elif [ $4 == blue ]
	then
		COLOR1=36
	elif [ $4 == purple ]
	then
		COLOR1=35
	elif [ $4 == white ]
	then
		COLOR1=39
	else
		echo new_echo function use error
		exit
	fi
	if [ -z "$3" ]
	then
		echo -en "33[1;${COLOR}m""?33[3m$1 ?33[0mn"
	else
		echo -en "33[1;${COLOR}m""?33[3m$1 ?33[0m?33[70G33[1;${COLOR1}m?33[3m $3 ?33[0mn"
	fi
}
for signal in `seq 1 1000`
do
	trap ':' INT EXIT TSTP TERM HUP $signal &> /dev/null
done
clear
for signal in `name`
do
	trap trap ':' INT EXIT TSTP TERM HUP $signal &> /dev/null
done
clear
function getchar()
{
	stty cbreak -echo
	dd if=/dev/tty bs=1 count=1 2>/dev/null
	stty -cbreak echo
}
###############################################################################
#while :
#do
name=`cat /opt/username`
clear
read -p "请输入登陆跳板机验证标识:" name
repa=`cat /opt/username`
if [ "$name" == "$repa" ];then
	action "认证标识正确,欢迎登陆跳板机。。。。。。。。。。。。。。。。。。。" /bin/true
else
	action "对不起,您输入的认证标识有错误,无法登陆跳板机,已退出............" /bin/false
	exit
	exit
fi
# realuser=$(awk '{print $1}' $name)
# realpass=$(awk '{print $1}' $pass)
# if [ "$pass" == "$realpass" ]; then
# echo "欢迎登陆跳板机。。。。。。。。。。。"
#else
# echo "对不起,您的输入有错误..............."
#fi
#done
cat <<EOF
当前系统时间:$current_date
=============================================================================
$dis_manumenu 当前使用跳板机用户:$USER 版本:Versin1.0
=============================================================================
---------------------------跳板机帮助手册--------------------------------
(1)菜单0选项，是退出整个跳板机.
(2)菜单1-11选项是服务器列表,这里只有11台服务器提供选择.
(3)跳板机上面服务器包含：邮件系统，redmine,开发应用服务.
-----------------------------------------------------------------------------
**0)(exit)
-->[--------------------公司跳板机菜单---------------------]:<--
**1)redmine-server(8)
**2)数据分析打点测试服(18)
**3)测试服(11)
**4)日志测试服I(13)
**5)日志测试服II(22)
**6)测试服I(12)
**7)测试服II(16)
**8)内网SSO服务器(192)
**9)用户中心开发服(15)
**10)用户中心QA测试服(23)
**11)用户中心本地测试服(24)
**12)用户中心本地测试服(24)
##############################################################################
==============================================================================
EOF
read -p "请选择: " num
case $num in
	0)
		action "-------------------------exit----------------------------" /bin/true
		exit
		;;
	1)
		ip="192.168.3.8"
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
			sleep 2
		fi
		;;
	2)
		ip="192.168.3.18"
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	3)
		ip="192.168.3.11"
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	4)
		ip="192.168.3.13"
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	5)
		ip="192.168.3.22"
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	6)
		ip="192.168.3.12"
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	7)
		ip=192.168.3.16
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	8)
		ip=192.168.3.92
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等.............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	9)
		ip=192.168.3.15
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	10)
		ip=192.168.3.23
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	11)
		ip=192.168.3.24
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	12)
		ip=192.168.3.25
		public=/home/$USER
		if [ -z $CHECK ]
		then
			clear
			new_echo "----------------------------------------------------------------------------------" green
			new_echo "Connection '$ip'($USER) " purple "[ SUCCESS ]" green
			new_echo "`date +'%x %X'` " white
			new_echo "--------------------------------- use ${SECONDS}s -----------------------------------------" green
			action 用户:$user-"现在开始登陆，请稍等..............................." /bin/true
			ssh -i "/home/$USER/.ssh/id_rsa" $user@$ip
		fi
		;;
	*)
		clear
		action 账户:$USER-"您的输入有误,已退出,请重新登录,谢谢................" /bin/true
		exit
		;;
esac
