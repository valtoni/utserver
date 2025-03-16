# https://wiki.unrealadmin.org/Server_Install_linux
sudo apt-get update
sudo apt-get -y install lib32z1

sudo groupadd unreal
sudo useradd -m -s /bin/bash -g unreal unreal
sudo chown vscode:vscode /home/unreal
sudo ln -s /workspaces/unrealserver/unreal /home/unreal
sudo chown -h vscode:vscode /home/unreal
sudo chown -R vscode:vscode /workspaces/unrealserver/unreal

chmod +x /home/unreal/ut-server/asu.sh
ln -s /home/unreal/ut-server/System/libSDL-1.1.so.0 /home/unreal/ut-server/System/libSDL-1.2.so.0

export UT_DATA_PATH="/home/unreal/ut-server/System"


# Try 2
PACK_DIR=/workspaces/unrealserver
NEW_UTDIR=/workspaces/us2
NEW_UTDIR_SERVER="$NEW_UTDIR/ut-server"
NEW_UTDIR_SYSTEM="$NEW_UTDIR_SERVER/System"
sudo mkdir $NEW_UTDIR
sudo chown vscode:vscode $NEW_UTDIR
tar -zxf $PACK_DIR/ut-server-436.tar.gz -C $NEWDIR
tar xfjv  $PACK_DIR/UTPGPatch451LINUX.tar.tar -C $NEWDIR
tar -zxf $PACK_DIR/asu-0.6.tar.gz -C $NEWDIR
chmod +x "$NEW_UTDIR_SERVER/asu.sh"
ln -s $NEW_UTDIR_SYSTEM/libSDL-1.1.so.0 $NEW_UTDIR_SYSTEM/libSDL-1.2.so.0
export UT_DATA_PATH="$NEW_UTDIR_SYSTEM"



# Startups tests
# https://unrealarchive.org/wikis/unreal-wiki/UCC.html
# https://www.oldunreal.com/wiki/index.php?title=UnrealTournament_Server_Guide
./ucc-bin server DM-Barricade?Botpack.DeathMatchPlus userini=vscode userini=./User.ini ini=./UnrealTournament.ini -nohomedir
./ucc-bin server JB-Rune-III.unr?Game=Jailbreak.Jailbreak ini=UnrealTournament.ini
./ucc-bin server RO-Konigsplatz.rom?game=ROEngine.ROTeamGame?deathmessagemode=3?FriendlyFireScale=1?FFPunishment=1?PreStartTime=60?RoundLimit=3?WinLimit=2?TimeLimit=0?FFKillLimit=8?FFDamageLimit=300?VACSecure=true?MinPlayers=0 --nohomedir
# ucc.exe server mapname.unr?game=GameType [port=portnum] [multihome=ipaddress] [ini=inifilename] [log=logfilename]
./ucc-bin server DM-Barricade?Botpack.DeathMatchPlus multihome=0.0.0.0 ini=UnrealTournament.ini
strace -e open,openat,stat,access,execve ./ucc-bin server DM-Barricade?Botpack.DeathMatchPlus multihome=0.0.0.0 ini=/workspaces/unrealserver/UnrealTournament.ini
./ucc server DM-Barricade\?game=Botpack.DeathMatchPlus userini=User.ini ini=/home/unreal/ut-server/./System/UnrealTournament.ini --nohomedir log=/dev/null
./ucc server DM-Barricade\?game=Botpack.DeathMatchPlus log=/dev/null
./ucc server DM-Barricade\?game=Botpack.DeathMatchPlus log=/dev/null multihome=0.0.0.0
