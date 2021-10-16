FROM ubuntu:20.04

# Install wget
RUN apt-get update
RUN apt-get install -y wget

# Add 32-bit architecture
RUN dpkg --add-architecture i386
RUN apt-get update

# Install Wine
RUN apt-get install -y software-properties-common gnupg2
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
RUN apt-get install -y winehq-devel winbind

# Turn off Fixme warnings
ENV WINEDEBUG=fixme-all

# Setup a Wine prefix
ENV WINEPREFIX=/root/.net 
ENV WINEARCH=win64
RUN winecfg

# Install Winetricks
RUN apt-get install -y cabextract
RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
RUN chmod +x winetricks
RUN cp winetricks /usr/local/bin

# Install .NET Framework 4.5.2
RUN wineboot -u && winetricks -q dotnet452

# Install SteamCMD
RUN apt install -y lib32gcc1
RUN mkdir /home/steamcmd && cd /home/steamcmd && wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && tar xvf steamcmd_linux.tar.gz

ENV DISPLAY=:0
ENV DISPLAY_WIDTH=1024
ENV DISPLAY_HEIGHT=768
ENV DISPLAY_DEPTH=16

WORKDIR	/home/hellion

COPY ./entrypoint.sh /entrypoint.sh
CMD	 ["/bin/bash", "/entrypoint.sh"]
