# Automation
lazy~

## cccatSign.sh（cccat自动签到
    添加了个telegram bot提醒的小功能，不需要的把🤖注释以下代码去掉即可
食用方法：服务器端cron定时任务
```
cron -e

#添加
0 6 * * * /root/cccatSign.sh >/dev/null 2>&1
```
    0 6 * * *               6点（4点签到刷新，例如 30 5 * * * 为5点30 ）
    /root/cccatSign.sh      文件地址
    >/dev/null 2>&1         不发送mail
ps.宝塔计划任务有bug，自己cron，注意文件权限
