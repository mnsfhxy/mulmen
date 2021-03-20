# mulmen
mentohust多拨脚本  

多开mentohust需要删除mentohust.pid  
如果其路径不在/var/mentohust.pid,则需在mentohust.sh中修改其路径  



mulmen.conf配置文件说明  
每一行会启动为一个mentohust.  
需要-b1参数使其在后台运行.  
需要-n参数指定不同的网卡接口  
其他参数根据不同认证方式自行设定  
例如:   
mentohust -b1 -nmacvlan2 -cudhcpc -i macvlan2  -d1 -uusername1 -ppassword1  
mentohust -b1 -nmacvlan3 -cudhcpc -i macvlan3  -d1 -uusername2 -ppassword2  


