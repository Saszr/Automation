# Automation

lazy~

## cccatSign.sh（cccat 自动签到

- 🌟 5.17 cccat.io 启用 hCaptcha 登陆验证

---

telegram bot🤖 提醒；多用户

食用方法：阅读相关代码注释->上传服务器 crontab 定时任务

```shell
crontab -e

#添加
0 6 * * * /root/cccatSign.sh >/dev/null 2>&1
```

```shell
0 6 * * *               6点（例如 30 5 * * * 为5点30 ）（艹艹猫4点签到刷新）
/root/cccatSign.sh      文件地址
>/dev/null 2>&1         不发送日志
```

ps.宝塔计划任务有 bug，自己 crontab，注意文件权限

## ShadowsocksServerPing.sh

计划用于路由器 Padavan 检测 ss 服务端是否宕机，配合 ServerChan 进行微信消息推送

食用方法：阅读相关代码注释->上传服务器 crontab 定时任务

```shell
crontab -e

#添加
0/30 * * * * /root/ShadowsocksServerPing.sh >/dev/null 2>&1
```

ps.注意文件权限，允许执行 744
