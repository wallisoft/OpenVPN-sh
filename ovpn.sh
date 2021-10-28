#!/bin/bash
#basic shell container for OpenVPN client.
#steve wallis 01/10/2021


PROFILE=
INSTALLDIR=



if [[ $1 == "-startup" ]]
then

    #call with -startup in startup applications to reconnect at boot if connected at shutdown.

    if ! grep -q Disconnected ~/.local/share/applications/ovpn-sh.desktop
    then
        nohup openvpn3 session-start --config $PROFILE &
    fi
    exit

elif [[ $1 == "-config" ]]
then

    #change/set ovpn connection profile
    
    FILE=`zenity --file-selection --title="Select OpenVPN Profile (usually *.ovpn)"`

    case $? in
         0)
             sed -i "/^PROFILE=/c\PROFILE=\"$FILE\"" $INSTALLDIR/ovpn.sh
             notify-send -i $INSTALLDIR/ovpn-off.png 'OpenVPN Profile Changed';;
         1)
             notify-send -i $INSTALLDIR/ovpn-off.png 'No OpenVPN Profile Selected';;
         -1)
             notify-send -i $INSTALLDIR/ovpn-off.png 'OpenVPN Unexpected Error';;
    esac
    exit
fi


#toggle connect/disconnect

ses=`openvpn3 sessions-list|grep Path -m1|cut -d':' -f 2`

if [[ $ses == *"openvpn"* ]]
then
	cp $INSTALLDIR/ovpn-sh.desktop.off ~/.local/share/applications/ovpn-sh.desktop
	notify-send -i $INSTALLDIR/ovpn-off.png 'Open VPN Disconnected'
	openvpn3 session-manage --session-path $ses --disconnect
else
	cp $INSTALLDIR/ovpn-sh.desktop.on ~/.local/share/applications/ovpn-sh.desktop
	notify-send -i $INSTALLDIR/ovpn-on.png 'Open VPN Connected'
	nohup openvpn3 session-start --config $PROFILE &
fi

