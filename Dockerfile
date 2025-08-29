FROM openjdk:11
RUN apt update && apt install -y bash \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
#F
COPY nexus-3* nexus
COPY sonatype-work sonatype-work
COPY nexus.vmoptions nexus/bin/nexus.vmoptions
RUN useradd -r -m -d /opt/nexus -s /bin/bash nexus \
&& chown -R nexus:nexus /opt/nexus /opt/sonatype-work
USER nexus
EXPOSE 8081
CMD ["/opt/nexus/bin/nexus", "run"]

