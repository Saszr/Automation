#!/bin/bash

# 注意帐号，密码替换
curl -d "email=xxx&passwd=xxx&remember_me=week" -c cccat_cookie.txt https://cccat.cc/user/_login.php

response=$(curl -b cccat_cookie.txt https://cccat.cc/user/_checkin.php)

re=$(echo -en $response)

# tg机器人消息通知
# 个人id替换 %uid（@userinfobot），bot_token替换 %bot_token（@BotFather）
curl -d "chat_id=%uid&parse_mode=Markdown&text=#CCCAT签到%0A返回结果：$re" https://api.telegram.org/bot%bot_token/sendMessage
