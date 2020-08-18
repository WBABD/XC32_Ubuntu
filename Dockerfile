FROM ubuntu:18.04

# Activate i386 architecture and update Ubuntu
#RUN dpkg --add-architecture i386 && \
  #  apt-get update && \
  #  apt-get -y install --no-install-recommends ca-certificates wget git make cmake build-essential libc6:i386 libncurses5:i386 libstdc++6:i386 && \
 #   rm -rf /var/lib/apt/lists/*
RUN  apt-get update \
  && apt-get install -y wget git make cmake build-essential \
  && rm -rf /var/lib/apt/lists/*

# Download XC32 installer and install
RUN cd /tmp && \
   wget --content-disposition https://www.microchip.com/mplabxc32linux && \
    chmod +x xc32-v2.41-full-install-linux-installer.run && \
    ./xc32-v2.41-full-install-linux-installer.run --mode unattended --netservername localhost && \
    rm xc32-v2.41-full-install-linux-installer.run
