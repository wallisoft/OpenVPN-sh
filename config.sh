#!/bin/bash

INSTALL="/home/steve/bin/ovpn"

FILE=`zenity --file-selection --title="Select OpenVPN Profile (usually *.ovpn)"`

case $? in
         0)
                sed -i "/profile=/c\profile=\"$FILE\"" $INSTALL/ovpn.sh
		notify-send -i /home/steve/bin/ovpn/ovpn-off.png 'OpenVPN Profile Changed';;
         1)
                notify-send -i /home/steve/bin/ovpn/ovpn-off.png 'No OpenVPN Profile Selected';;
        -1)
                notify-send -i /home/steve/bin/ovpn/ovpn-off.png 'OpenVPN Unexpected Error';;
esac

