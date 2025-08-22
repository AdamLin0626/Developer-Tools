@echo off
setlocal enabledelayedexpansion

set "FOLDER=apps"

:: 檢查 reset
if "%1"=="reset" (
    if exist "%FOLDER%" rd /s /q "%FOLDER%"
    echo 已重置，下次執行請把捷徑放到 %FOLDER% 資料夾。
    pause
    exit /b
)

:: 建立資料夾（如果不存在）
if not exist "%FOLDER%" (
    mkdir "%FOLDER%"
    echo 請把要啟動的程式捷徑或 EXE 放到 %FOLDER% 資料夾
    pause
    exit /b
)

:: 扫描資料夾並執行
echo 正在啟動 %FOLDER% 裡的程式...
for %%A in ("%FOLDER%\*") do (
    echo 啟動：%%~fA
    start "" "%%~fA"
)

pause
