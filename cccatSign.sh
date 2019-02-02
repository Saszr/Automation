#!/bin/bash

# 注意帐号，密码替换
curl -d "email=xxx&passwd=xxx&remember_me=week" -c cccat_cookie.txt https://cccat.cc/user/_login.php

response=$(curl -b cccat_cookie.txt https://cccat.cc/user/_checkin.php)



# tg机器人消息通知  -------无需求以下代码请删除-------

#返回消息格式化
str0=${response#*:}&&str1=${str0%"}"*}&&str2=${str1/\u4e86/\u4e86 }&&str3=${str2/\u00d7/\u00d7 }
str=$(echo $str3 |ascii2uni -a U -q)

# 个人id替换 %uid（@userinfobot），bot_token替换 %bot_token（@BotFather）
curl -d "chat_id=%uid&parse_mode=Markdown&text=#CCCAT签到%0A$str" https://api.telegram.org/bot%bot_token/sendMessage
