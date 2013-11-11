if [ "$DEV_SERIAL" == "" ]; then
    echo Please specify DEV_SERIAL
    exit 1
fi

# launch settings wifi page
adb -s $DEV_SERIAL shell am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -f 0x10200000 -n com.android.settings/.Settings
sleep 3
adb -s $DEV_SERIAL shell input tap 210 250

# open wifi if it's off
adb -s $DEV_SERIAL shell netcfg | grep wlan0 | grep DOWN
if [ $? == '0' ]; then
    sleep 3
    adb -s $DEV_SERIAL shell input tap 650 100
fi
sleep 3

# add new AP
adb -s $DEV_SERIAL shell input tap 360 1140
sleep 3
adb -s $DEV_SERIAL shell input text ryc8f-8l04usb-ap01
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_DOWN
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_CENTER
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_DOWN
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_DOWN
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_CENTER
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_DOWN
adb -s $DEV_SERIAL shell input text Hs_8L041980
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_DOWN
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_RIGHT
adb -s $DEV_SERIAL shell input keyevent KEYCODE_DPAD_CENTER

