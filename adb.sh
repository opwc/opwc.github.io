#!/bin/bash
mkdir -p "$HOME/adb"
echo "使用Shizuku实现adb shell功能的脚本 (˃◡˂) "
echo "版本: DEV 0.16"
cd "$HOME/adb" || exit
a="rish_shizuku.dex"
if [ ! -f "$a" ]; then
wget -q --show-progress "https://gitee.com/bedlock/via/raw/main/$a"
if [ $? -ne 0 ]; then
echo "错误：下载DEX文件失败，请检查网络连接后重试。"
exit 1
fi
fi
if [ ! -f "$a" ]; then
echo "错误：DEX文件不存在于指定路径。"
exit 1
else
echo "环境配置成功！"
fi
DEX="$HOME/adb/$a"
export RISH_APPLICATION_ID=${RISH_APPLICATION_ID:-bin.mt.plus}
/system/bin/app_process -Djava.class.path="$DEX" /system/bin --nice-name=rish rikka.shizuku.shell.ShizukuShellLoader "$@"