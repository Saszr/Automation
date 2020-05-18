#!/bin/bash

# 注意帐号，密码替换
curl --cookie "uid=xxx;user_email=xxx;user_pwd=xxx" https://cccat.io/user/_checkin.php

# 以上 无通知单用户
# 以下 tg机器人消息通知；可多账号
# 选择使用版本，删除其他代码
# 🌟 uid/user_email/user_pwd 需要登录后查看网站的 Cookis，f12->Application 里查看或者使用相关插件 http://www.editthiscookie.com/

#!/bin/bash

# 注意帐号，密码替换
user1="uid=xxx;user_email=xxx;user_pwd=xxx"
#user2="uid=xxx;user_email=xxx;user_pwd=xxx
#user3="uid=xxx;user_email=xxx;user_pwd=xxx"

users=($user1)
# users=($user1 $user2 $user3)

for i in "${!users[@]}"; do
  #tg机器人消息通知 用户名格式化
  userAllInfo=${users[$i]}
  a=${userAllInfo#*"user_email="} && userEmail=${a%%";user_pwd"*}
  #绕过hCaptcha登录验证
  response=$(curl --cookie "${users[$i]}" https://cccat.io/user/_checkin.php)
  #返回消息格式化
  str0=${response#*:} && str1=${str0%"}"*} && str2=${str1/\u4e86/\u4e86 } && str3=${str2/\u00d7/\u00d7 }
  str=$(echo $str3 | ascii2uni -a U -q)
  # 个人id替换 %uid（@userinfobot），bot_token替换 %bot_token（@BotFather）
  curl -d "chat_id=519099094&text=#CCCAT签到%0A$userEmail%0A$str" https://api.telegram.org/bot%bot_token/sendMessage
done
