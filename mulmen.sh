#!/bin/bash
RED='\E[1;31m'       
GREEN='\E[1;32m'    
PINK='\E[1;35m'     
RES='\E[0m'          
PID_PATH='/var/mentohust.pid' #mentohust.pid的路径
CONF_PATH='/etc/mulmen.conf' #配置文件路径
MENTOHUST_STATU=$(ps -ef |grep -w mentohust|grep -v grep|wc -l)
if [ -d $CONF_PATH ]
then
echo -e ${RED}加载配置文件${CONF_PATH}${RES}
else
echo -e ${RED}${CONF_PATH}配置文件不存在!!${RES}
exit
fi
echo -e ${RED}${RES}
if [ ${MENTOHUST_STATU} -gt 0 ]
then
echo -e "${RED}检测到已开启mentohust${RES}"
echo $(ps -ef |grep -w mentohust|grep -v)
kill -9 `ps | grep mentohust| grep -v grep|awk '{print $1}'`
echo -e "${RED}已关闭打开的mentohust${RES}"
fi
flag=1
OLD_IFS=$IFS   
IFS=$'\n'        
for line in $(cat $CONF_PATH)
do
echo -e "${GREEN}----正在开启第${flag}个mentohust----${RES}"
sleep 1s
eval $line
echo -e "${GREEN}----第${flag}个mentohust开启完成----${RES}"
rm -rf $PID_PATH
echo -e "${PINK}----PID文件已删除----${RES}"
let flag=flag+1
done
IFS=$OLD_IFS   


