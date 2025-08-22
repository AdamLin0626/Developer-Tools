#!/bin/bash

FOLDER="apps"

# reset
if [ "$1" = "reset" ]; then
    rm -rf "$FOLDER"
    echo "已重置，下次執行請把捷徑或執行檔放到 $FOLDER 資料夾。"
    exit 0
fi

# 建立資料夾（如果不存在）
if [ ! -d "$FOLDER" ]; then
    mkdir -p "$FOLDER"
    echo "請把要啟動的程式捷徑或執行檔放到 $FOLDER 資料夾"
    exit 0
fi

# 執行資料夾內所有檔案
echo "正在啟動 $FOLDER 裡的程式..."
for app in "$FOLDER"/*; do
    [ -f "$app" ] || continue
    echo "啟動: $app"
    nohup "$app" >/dev/null 2>&1 &
done
