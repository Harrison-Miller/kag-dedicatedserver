FROM ubuntu:18.04 as build

# Download and uncompress the software
RUN apt-get update -y && \
	apt-get install wget -y && \
	wget -O /tmp/kag-linux32-dedicated-release.tar.gz http://dl.kag2d.com/kag-linux32-dedicated-release.tar.gz && \
	mkdir -p /opt/KAG && \
	tar -zxf /tmp/kag-linux32-dedicated-release.tar.gz -C /opt/KAG

# Using multi-stage build to remove extra layers
FROM ubuntu:18.04

# Install dependencies to run the server
RUN dpkg --add-architecture i386 && \
	apt-get update -y && \
	apt-get install libc6:i386 libstdc++6:i386 libglapi-mesa:i386 \
	libgl1-mesa-glx:i386 libxxf86vm1:i386 libxext6:i386 libx11-6:i386 \
	libfreetype6:i386 libgcc1-dbg:i386 libxdamage1:i386 libxfixes3:i386 \
	libx11-xcb1:i386 libxcb-glx0:i386 libxcb-dri2-0:i386 libxcb1:i386  \
	libdrm2:i386 libxdmcp6:i386 -y && \
	mkdir -p /opt/KAG

COPY --from=build /opt/KAG /opt/KAG

RUN chmod +x /opt/KAG/dedicatedserver.sh && chmod +x /opt/KAG/KAGdedi

ADD bin/entrypoint.sh /opt/KAG/entrypoint.sh
ADD bin/autoconfig.cfg /opt/KAG/autoconfig.cfg.tmpl

EXPOSE 50301/tcp
EXPOSE 50301/udp

# defining variables to use in configuration
ENV GAMEMODE "CTF"
ENV NAME "Default Server"
ENV DESCRIPTION ""
ENV MAX_PLAYERS 20
ENV MAPCYCLE ""
ENV SV_PASSWORD ""
ENV RCON_PASSWORD ""
ENV PORT 50301

WORKDIR /opt/KAG

ENTRYPOINT ["./entrypoint.sh"]
CMD ["./dedicatedserver.sh"]
