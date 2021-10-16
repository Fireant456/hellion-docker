#/bin/sh

/home/steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/hellion +app_update 598850 validate +quit

cd /home/hellion
mv GameServer_example.ini GameServer.ini

if [ ! -z "$ServerName" ]; then
    sed -i "s/Hellion Game Server/${ServerName}/g" GameServer.ini
fi
if [ ! -z "$GamePort" ]; then
    sed -i "s/6004/${GamePort}/g" GameServer.ini
fi
if [ ! -z "$StatusPort" ]; then
    sed -i "s/6005/${StatusPort}/g" GameServer.ini
fi

wine HELLION_Dedicated.exe