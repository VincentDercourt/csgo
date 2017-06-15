FROM debian:latest

LABEL maintainer="pixel@rageclic.fr" \
	  version=1.0 \
	  description="Create a server csgoserver"

RUN apt-get update

COPY ./*.* /

RUN chmod 755 /start.sh \
    && sed -i -e 's/\r$//' /start.sh \
    && useradd -ms /bin/bash csgoserver \
    && echo "csgoserver:csgoserver" | chpasswd && adduser csgoserver sudo \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y locales mailutils postfix curl wget file bzip2 gzip unzip binutils bsdmainutils python util-linux ca-certificates tmux lib32gcc1 libstdc++6 libstdc++6:i386 expect sudo

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8

VOLUME /home/csgoserver

USER csgoserver

WORKDIR /home/csgoserver

EXPOSE 27015 27020 27005 27015/udp 27020/udp 27005/udp

CMD ["/start.sh"]