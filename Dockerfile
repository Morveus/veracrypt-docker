# Use Debian Bullseye Slim as the base image
FROM debian

# Set environment variables to avoid interactive dialogues during installation
ENV DEBIAN_FRONTEND noninteractive

# Update the package repository and install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    gpg \
    dirmngr \
    libwxgtk3.2-1 \ 
    libayatana-appindicator3-1 \
    libfuse2 \
    dmsetup \
    sudo \
    libpcsclite1 \
    pcscd \
    wget \
    --no-install-recommends

# Download VeraCrypt
RUN wget --no-check-certificate https://github.com/veracrypt/VeraCrypt/releases/download/VeraCrypt_1.26.7/veracrypt-1.26.7-Debian-12-amd64.deb -O veracrypt.deb

# Install VeraCrypt
RUN dpkg -i veracrypt.deb || apt-get install -f

# Cleanup
#RUN apt-get clean \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#    && rm veracrypt.deb

# Set the entrypoint to veracrypt
#ENTRYPOINT ["/bin/sh"]
