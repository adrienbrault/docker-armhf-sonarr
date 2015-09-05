FROM resin/rpi-raspbian:wheezy-2015-09-02

MAINTAINER Adrien Brault <adrien.brault@gmail.com>

# sonarr needs mono 3.1, without this 3.2 is going to be installed
ADD apt-preferences /etc/apt/preferences

RUN apt-get update -qy && \
    apt-get install libmono-cil-dev apt-transport-https -qy --force-yes && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    echo "deb https://apt.sonarr.tv/ master main" | tee -a /etc/apt/sources.list.d/sonarr.list && \
    apt-get update -qy && \
    apt-get install -qy nzbdrone mediainfo && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/config","/media","/downloads"]

EXPOSE 8989
EXPOSE 9898

WORKDIR /opt/NzbDrone

CMD ["mono", "/opt/NzbDrone/NzbDrone.exe", "--no-browser", "-data=/config"]
