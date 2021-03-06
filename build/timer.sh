#!/bin/bash

# ==============================================
# 此脚本由Jenkins触发 生成本地配置 timer.plist
# 然后由系统定时调用plist指定的脚本timerjob.sh
# 	参考：https://my.oschina.net/shede333/blog/470377
#   查看进程是否开启： launchctl list | grep com.pwrd
# ==============================================

echo "参数 branch: "${branch}" loginserver: "${loginserver}


cd `dirname $0`

# 强制关闭服务
launchctl unload timer.plist

/usr/libexec/PlistBuddy -c "Set :ProgramArguments:1 ${branch}" timer.plist

/usr/libexec/PlistBuddy -c "Set :ProgramArguments:2 ${loginserver}" timer.plist

# 开启服务
launchctl load timer.plist

launchctl list | grep com.pwrd

