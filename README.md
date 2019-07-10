# Automation
lazy~

## cccatSign.sh（cccat自动签到
    telegram bot🤖提醒；多用户
食用方法：阅读相关代码注释->上传服务器crontab定时任务
```
crontab -e

#添加
0 6 * * * /root/cccatSign.sh >/dev/null 2>&1
```
    0 6 * * *               6点（例如 30 5 * * * 为5点30 ）（艹艹猫4点签到刷新）
    /root/cccatSign.sh      文件地址
    >/dev/null 2>&1         不发送日志
ps.宝塔计划任务有bug，自己crontab，注意文件权限
## ShadowsocksServerPing.sh
    计划用于路由器Padavan检测ss服务端是否宕机，配合ServerChan进行微信消息推送
食用方法：阅读相关代码注释->上传服务器crontab定时任务
```
crontab -e

#添加
0/30 * * * * /root/ShadowsocksServerPing.sh >/dev/null 2>&1
```
ps.注意文件权限，允许执行 744
