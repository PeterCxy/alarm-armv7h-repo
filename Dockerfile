FROM agners/archlinuxarm-arm32v7:latest

RUN echo "nameserver 1.1.1.1" > /etc/hosts

RUN pacman -Syu --noconfirm --ignore=filesystem && pacman -S --noconfirm base-devel git

COPY ./build.sh /build.sh

RUN chmod +x /build.sh && mkdir /mnt/src && mkdir /mnt/out

VOLUME /mnt/src
VOLUME /mnt/src_cache
VOLUME /mnt/out
VOLUME /mnt/repo
VOLUME /tmp

CMD /build.sh

