#!/bin/bash

# 注意帐号，密码替换
curl -d "email=xxx&passwd=xxx&remember_me=week" -c cccat_cookie.txt https://cccat.cc/user/_login.php

response=$(curl -b cccat_cookie.txt https://cccat.cc/user/_checkin.php)


# 以上 无通知单用户
# 以下 tg机器人消息通知；可多账号
# 选择使用版本，删除其他代码

#!/bin/bash

# 注意帐号，密码替换
user1="email=xxx&passwd=xxx&remember_me=week"
#user2="email=xxx&passwd=xxx&remember_me=week"
#user3="email=xxx&passwd=xxx&remember_me=week"
users="$user1 $user2 $user3"
set -- $users
while [ -n "$1" ]; do
        #tg机器人消息通知 用户名格式化
        username1=${1#*"="}&&username2=${username1%%"&"*}
        #帐号密码的判断，防止直接使用之前本地cookie导致消息通知错误
        login=$(curl -d "$1" -c cccat_cookie.txt https://cccat.cc/user/_login.php)
        code="ok"
        if [[ $login == *$code* ]]
        then
            response=$(curl -b cccat_cookie.txt https://cccat.cc/user/_checkin.php)
            #返回消息格式化
            str0=${response#*:}&&str1=${str0%"}"*}&&str2=${str1/\u4e86/\u4e86 }&&str3=${str2/\u00d7/\u00d7 }
            str=$(echo $str3 |ascii2uni -a U -q)
            # 个人id替换 %uid（@userinfobot），bot_token替换 %bot_token（@BotFather）
            curl -d "chat_id=%uid&text=#CCCAT签到%0A$username2%0A$str" https://api.telegram.org/bot%bot_token/sendMessage
        else
            # 个人id替换 %uid（@userinfobot），bot_token替换 %bot_token（@BotFather）
            curl -d "chat_id=%uid&text=#CCCAT签到%0A$username2%0A登录失败!" https://api.telegram.org/bot%bot_token/sendMessage
        fi
    shift
done
