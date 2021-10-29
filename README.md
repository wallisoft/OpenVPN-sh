# OpenVPN-sh.sh

Adds icon to favourites to connect/disconnect OpenVPN's linux client.

Simple bash script to start/stop OpenVPN. The installer adds an icon to your favorites and adds an autostart file. Click the icon to toggle connection on/off. The icon colour changes to green when connected. If you are connected at shutdown the script will reconnect at boot.

Right click the icon to browse for your *.ovpn profile

The installation script ovpn-sh_install.sh contains an embedded tarfile with all files. Add execute permission and run as a non priveliged user to add application icon to your favorites and autostart connection at boot.

Only tested for Gnu desktop on ubuntu 20.04 but should be fine for any Gnu desktop.

OpenVPN's Client package must first be installed from https://openvpn.net . Their linux client is command line only so I wrote this. 

To install download ovpn-sh_install.sh, add execute permissions and run as a non priveleged user. The installer contains an embedded tarfile with all installation files. It will add icon to favorites and add application to Applications and startup. When run for the first time right click and select your *.ovpn profile from your VPN providor.


TODO Add context menu option to edit connection script (enable DCO etc.). Add installer config for alternative desktops.
