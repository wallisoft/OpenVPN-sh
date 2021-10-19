#!/bin/bash
#basic shell container for OpenVPN client.
#steve wallis 01/10/2021


ses=`openvpn3 sessions-list|grep Path -m1|cut -d':' -f 2`

if [[ $ses == *"openvpn"* ]]
then
	cp ovpn-off.png ovpn.png
	notify-send -i /home/steve/bin/ovpn/ovpn-off.png 'Open VPN Disconnected'
	openvpn3 session-manage --session-path $ses --disconnect
else
	cp ovpn-on.png ovpn.png
	notify-send -i /home/steve/bin/ovpn/ovpn-on.png 'Open VPN Connected'
	nohup openvpn3 session-start --config /home/steve/bin/ovpn/steve_w10.ovpn &
fi

