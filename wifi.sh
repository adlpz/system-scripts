
CMD_CURRENT_SSID="nmcli -t -f active,ssid dev wifi | grep -e \"^yes\" | cut -d: -f2"

case $1 in
    ssid)
        eval $CMD_CURRENT_SSID
        ;;
esac
