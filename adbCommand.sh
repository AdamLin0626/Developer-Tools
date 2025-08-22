#!/bin/bash

# Define ANSI color codes for menu presentation
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to pause and wait for user input
function pause() {
  read -p "Press [Enter] to continue..."
}

# Function to display the menu and handle user choices
function menu() {
  while true; do
    clear
    echo -e "${GREEN}====================================${NC}"
    echo -e "${GREEN}  ADB Simple Tool Menu  ${NC}"
    echo -e "${GREEN}====================================${NC}"
    echo "1. List Devices"
    echo "2. Specify Device"
    echo "3. Install APK"
    echo "4. Push File to Device"
    echo "5. Pull File from Device"
    echo "6. Copy App Data"
    echo "7. Back to Home Screen"
    echo "8. Launch Specific App"
    echo "9. List Installed Apps"
    echo "10. Uninstall App"
    echo "11. Force Stop App"
    echo "12. Return to Launcher"
    echo "13. Power Off Device"
    echo "0. Exit"
    echo -e "${GREEN}====================================${NC}"

    read -p "Enter your choice: " choice

    case $choice in
      1)
        # List all connected devices
        adb devices
        pause
        ;;
      2)
        # Specify the device ID for operations
        read -p "Please enter device ID: " deviceID
        [cite_start]echo "Selected device: $deviceID" [cite: 2]
        pause
        ;;
      3)
        # Install an APK to the device
        read -p "Please enter APK path: " apkPath
        [cite_start]adb install "$apkPath" [cite: 3]
        pause
        ;;
      4)
        # Transfer a file to the device
        read -p "Source file path: " srcPath
        read -p "Target path on device: " targetPath
        adb push "$srcPath" "$targetPath"
        pause
        ;;
      5)
        # Pull a file from the device to the computer
        read -p "Device file path: " srcPath
        read -p "Computer target path: " targetPath
        [cite_start]adb pull "$srcPath" "$targetPath" [cite: 3]
        pause
        ;;
      6)
        # Copy App database
        read -p "App package name: " packageName
        read -p "Database name: " dbName
        read -p "Computer target path: " targetPath
        # First create the database file on the phone's /sdcard, then pull it to the computer
        adb shell "run-as $packageName cat /data/data/$packageName/databases/$dbName > /sdcard/$dbName"
        adb pull "/sdcard/$dbName" "$targetPath"
        pause
        ;;
      7)
        # Go back to the device's home screen
        adb shell input keyevent KEYCODE_HOME
        pause
        ;;
      8)
        # Launch a specific app
        read -p "App package name: " appName
        [cite_start]adb shell am start -n "$appName/.MainActivity" [cite: 4]
        pause
        ;;
      9)
        # List all installed app packages
        adb shell pm list packages
        pause
        ;;
      10)
        # Uninstall an app
        read -p "App package name: " appName
        [cite_start]adb uninstall "$appName" [cite: 4]
        pause
        ;;
      11)
        # Force stop an app
        read -p "App package name: " appName
        adb shell am force-stop "$appName"
        pause
        ;;
      12)
        # Return to Launcher
        [cite_start]adb shell am start -a android.intent.action.MAIN -n com.android.launcher3/.Launcher [cite: 5]
        pause
        ;;
      13)
        # Power off device
        adb shell reboot -p
        pause
        ;;
      0)
        # Exit the script
        echo "Exiting."
        exit 0
        ;;
      *)
        echo "Invalid choice, please try again."
        pause
        ;;
    esac
  done
}

# Start the menu
menu