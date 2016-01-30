FROM debian:stable

MAINTAINER Jakob Runge <sicarius@g4t3.de>

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Setup multiarch because Skype is 32bit only
RUN dpkg --add-architecture i386

# Make sure the repository information is up to date
RUN apt-get update

# Install PulseAudio for i386 (64bit version does not work with Skype)
RUN apt-get install -y libpulse0:i386 pulseaudio:i386

# We need ssh to access the docker container, wget to download skype
RUN apt-get install -y wget sudo

# Install Skype
RUN wget http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb -O /usr/src/skype.deb
RUN dpkg -i /usr/src/skype.deb || true
RUN apt-get install -fy						# Automatically detect and install dependencies

# Set entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
