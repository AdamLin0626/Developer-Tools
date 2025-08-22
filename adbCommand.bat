@echo off
chcp 65001 >nul

:MENU
cls
echo ====================================
echo ADB Simple Tool Menu
echo ====================================
echo 1. List Devices
echo 2. Specify Device
echo 3. Install APK
echo 4. Push File to Device
echo 5. Pull File from Device
echo 6. Copy App Data
echo 7. Back to Home Screen
echo 8. Launch Specific App
echo 9. List Installed Apps
echo 10. Uninstall App
echo 11. Force Stop App
echo 12. Return to Launcher
echo 13. Power Off Device
echo 0. Exit
echo ====================================
set /p choice=Enter your choice: 

:: 列出所有連接的裝置
if "%choice%"=="1" (
    adb devices
    pause
    goto MENU
)

:: 指定要操作的裝置 ID
if "%choice%"=="2" (
    set /p deviceID=請輸入裝置 ID: 
    echo 選擇的裝置: %deviceID%
    pause
    goto MENU
)

:: 安裝 APK 到裝置
if "%choice%"=="3" (
    set /p apkPath=請輸入 APK 路徑: 
    adb install "%apkPath%"
    pause
    goto MENU
)

:: 傳送檔案到手機
if "%choice%"=="4" (
    set /p srcPath=來源檔案路徑: 
    set /p targetPath=手機目標路徑: 
    adb push "%srcPath%" "%targetPath%"
    pause
    goto MENU
)

:: 從手機拉取檔案到電腦
if "%choice%"=="5" (
    set /p srcPath=手機檔案路徑: 
    set /p targetPath=電腦目標路徑: 
    adb pull "%srcPath%" "%targetPath%"
    pause
    goto MENU
)

:: 複製 App 資料庫
if "%choice%"=="6" (
    set /p packageName=App 套件名: 
    set /p dbName=資料庫名: 
    set /p targetPath=電腦目標路徑: 
    :: 先在手機 /sdcard 建立資料庫檔案，再拉取到電腦
    adb shell "run-as %packageName% cat /data/data/%packageName%/databases/%dbName% > /sdcard/%dbName%"
    adb pull /sdcard/%dbName% "%targetPath%"
    pause
    goto MENU
)

:: 回到手機主頁
if "%choice%"=="7" (
    adb shell input keyevent KEYCODE_HOME
    pause
    goto MENU
)

:: 開啟指定 App
if "%choice%"=="8" (
    set /p appName=App 套件名: 
    adb shell am start -n %appName%/.MainActivity
    pause
    goto MENU
)

:: 列出已安裝 App 套件
if "%choice%"=="9" (
    adb shell pm list packages
    pause
    goto MENU
)

:: 卸載 App
if "%choice%"=="10" (
    set /p appName=App 套件名: 
    adb uninstall %appName%
    pause
    goto MENU
)

:: 強制關閉 App
if "%choice%"=="11" (
    set /p appName=App 套件名: 
    adb shell am force-stop %appName%
    pause
    goto MENU
)

:: 回到 Launcher
if "%choice%"=="12" (
    adb shell am start -a android.intent.action.MAIN -n com.android.launcher3/.Launcher
    pause
    goto MENU
)

:: 關機
if "%choice%"=="13" (
    adb shell reboot -p
    pause
    goto MENU
)

:: 離開批次檔
if "%choice%"=="0" exit

goto MENU