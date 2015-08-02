#!/bin/sh

# 監視パーティション
partition_1=/dev/sda1

# ディスク使用率閾値(%)
shikii_1=80

# 通知先メールアドレス
mailaddress="tamohiko@server-memo.net"


srvname=`hostname`
subject="$srvname Disk space alert"
maildata=`hostname &&  date && df -h`
used_1=` df -h | grep $partition_1 | awk '{ print $5 }' | sed -e '$s/.$//' `



if [ $used_1 -lt $shikii_1 ]
  then
    echo ok
  else
    mail -s "$subject" $mailaddress << MAILDATA
$maildata
MAILDATA
fi
