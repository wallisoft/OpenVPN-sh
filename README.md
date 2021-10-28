# OpenVPN-sh.sh

Adds shell script icon to favourites to connect/disconnect OpenVPN's linux client.

Simple bash script to start/stop OpenVPN. Creates an icon in your favorites. Click icon to toggle connection on/off. Icon colour changes to green when connected. If you are connected at shutdown the script will reconnect you at boot.

Right click the icon to browse for your *.ovpn profile

The installation script ovpn-sh_install.sh contains an embedded tarfile with all files. Add execute permission and run as a non priveliged user to add application icon to your favorites and autostart connection at boot.

Only tested for Gnu desktop on ubuntu 20.04 but should be fine for any Gnu desktop.


OpenVPN's Client package must be installed first from https://openvpn.net . Their linux client is command line only so I wrote this. 


TODO Add option to edit connection script to enable DCO support for example. Add installer options for desktops othen than Gnu.
