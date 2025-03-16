# Unreal Tournament 99 Linux Server

Configuration files to run Unreal Tournament Server '99.

You must download [ut-server-436.tar.gz](http://ut-files.com/Entire_Server_Download/ut-server-436.tar.gz) [UTPGPatch451LINUX.tar.tar](http://www.ut-files.com/Patches/UTPGPatch451LINUX.tar.tar) and [asu-0.6.tar.gz](http://www.ut-files.com/Patches/UTPGPatch451LINUX.tar.tar) manually to build Dockerfile.

Run dockerfile locally:

``` bash
docker run -p7777:7777/udp -p7778:7778/udp -p8777:8777/tcp --name=unreal_server valtoni/unreal-server:latest
```

[Dockerfile](Dockerfile) was based in that installation of Unreal Admin Wiki <https://wiki.unrealadmin.org/Server_Install_linux?form=MG0AV3>.

## References

https://wiki.unrealadmin.org/Server_Install_linux
https://wiki.unrealadmin.org/Main_Page
https://wiki.unrealadmin.org/Unreal_Tournament
https://ut99.org/ut99.org/viewtopic.php?t=11810
https://www.oldunreal.com/wiki/index.php?title=UnrealTournament_Server_Guide
https://unrealadmin.org/forums/showthread.php?t=23628
https://github.com/RIKIKU/UT99-Tools/tree/main/src
