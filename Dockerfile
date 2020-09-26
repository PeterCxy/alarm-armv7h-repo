FROM agners/archlinuxarm-arm64v8:latest

RUN echo "nameserver 1.1.1.1" > /etc/hosts

RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel git

COPY ./build.sh /build.sh

RUN chmod +x /build.sh && mkdir /mnt/src && mkdir /mnt/out

VOLUME /mnt/src
VOLUME /mnt/out

CMD /build.sh

