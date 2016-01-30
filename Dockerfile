FROM debian:stable

MAINTAINER Jakob Runge <sicarius@g4t3.de>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386

RUN apt-get update \
 && apt-get install -y libpulse0:i386 pulseaudio:i386 wget sudo

RUN wget http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb -O /usr/src/skype.deb
RUN dpkg -i /usr/src/skype.deb || true
RUN apt-get install -fy

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
