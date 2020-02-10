FROM ubuntu:disco

# Activate i386 architecture and update Ubuntu
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install --no-install-recommends ca-certificates wget git make libc6:i386 libncurses5:i386 libstdc++6:i386 && \
    rm -rf /var/lib/apt/lists/*

# Download XC32 installer
RUN cd /tmp && \
    wget --content-disposition https://www.microchip.com/mplabxc32linux

# Install XC32
RUN cd /tmp && \
    chmod +x xc32-v2.30-full-install-linux-installer.run && \
    ./xc32-v2.30-full-install-linux-installer.run --debuglevel 4 --mode unattended --netservername localhost && \
    rm xc32-v2.30-full-install-linux-installer.run
