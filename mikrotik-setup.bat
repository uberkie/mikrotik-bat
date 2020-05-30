ECHO OFF
CLS
: Loop
: MENU
echo.
echo
echo Press 1, 2, 3 to select the task.
echo You can always press Ctrl and c to quit.
echo
echo 1 - Ping the router
echo 2 - Setup the router
echo 3 - Exit
echo.
SET /P M=Type 1, 2, 3 then press ENTER
IF %M%==1 ping 192.168.88.1
IF %M%==2 GOTO SETUP1
IF %M%==3 GOTO EOF
GOTO Loop
:SETUP1
echo Please type the local ip address just use 192.168.100.254 and press ENTER
SET /P local=
echo Please type the gateway ip address just use 192.168.100.1 and press ENTER
SET /P gateway=
echo Please type the dns ip address you can use 1.1.1.1 and press ENTER
SET /P dns=
echo Please type the wifi name and press ENTER
SET /P wifi=
echo Please type the wifi password and press ENTER
SET /P password=
echo The rest of the setup wil be done automaticaly
echo Please dont switch off or unplug
ssh admin@192.168.88.1'/interface bridge add name=bridge1
ssh admin@192.168.88.1'/interface bridge port add bridge=bridge1 interface=all
ssh admin@192.168.88.1'/interface list remove all
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall filter remove numbers=0
ssh admin@192.168.88.1'/ip firewall nat remove numbers=0
ssh admin@192.168.88.1'/ip dhcp-server remove numbers=0
ssh admin@192.168.88.1'/ip dhcp-client remove numbers=0
ssh admin@192.168.88.1'/ip dns set servers=%dns%
ssh admin@192.168.88.1'/ip route add dst-address=0.0.0.0 gateway=%gateway% 
ssh admin@192.168.88.1'/interface wireless security-profiles add wpa2-pre-shared-key=%password% name=12
ssh admin@192.168.88.1'/interface wireless add mode=ap-bridge master-interface=wlan1 security-profile=12 ssid=%wifi%
ssh admin@192.168.88.1'/ip address add address=%local% interface=bridge1 
