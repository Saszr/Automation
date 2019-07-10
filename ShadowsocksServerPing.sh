#!/bin/bash

ping_success_status() {
    if ping -c 1 $IP >/dev/null; then
        echo "$IP Ping is successful."
        continue
    fi
}

#Padavan Shadowsocks设置中有主服务器和备用服务器
IP_LIST="主节点地址 备用节点地址"
server_status=0

for IP in $IP_LIST; do
    ping_success_status
    ping_success_status
    ping_success_status
    echo "$IP Ping is failure!"
    server_status=`expr $server_status + 1`
done

#主服务器和备用服务器都挂掉才提醒
if [ $server_status = 2 ]
then
    #http://sc.ftqq.com绑定微信获取SCKEY
    curl -d "text=主人服务器都挂掉啦~" https://sc.ftqq.com/SCKEY.send
else
    echo "运行正常"
fi