#!/bin/bash
#basic shell container for OpenVPN client.
#steve wallis 01/10/2021


profile="/home/steve/bin/ovpn/steve_w10.ovpn"



#call with -startup in startup applications to reconnect at boot if connected at shutdown.

if [[ $1 == "-startup" ]]
then
    echo "startup"
    if ! grep -q Disconnected /usr/share/applications/ovpn.ovpn.desktop
    then
        nohup openvpn3 session-start --config $profile &
    fi
    exit
fi



#toggle connect/disconnect

ses=`openvpn3 sessions-list|grep Path -m1|cut -d':' -f 2`

if [[ $ses == *"openvpn"* ]]
then
	cp ovpn-off.png ovpn.png
	cp /home/steve/bin/ovpn/ovpn.ovpn.desktop.off /usr/share/applications/ovpn.ovpn.desktop
	notify-send -i /home/steve/bin/ovpn/ovpn-off.png 'Open VPN Disconnected'
	openvpn3 session-manage --session-path $ses --disconnect
else
	cp ovpn-on.png ovpn.png
	cp /home/steve/bin/ovpn/ovpn.ovpn.desktop.on /usr/share/applications/ovpn.ovpn.desktop
	notify-send -i /home/steve/bin/ovpn/ovpn-on.png 'Open VPN Connected'
	nohup openvpn3 session-start --config $profile &
fi

