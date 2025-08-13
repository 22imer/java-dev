FROM codercom/code-server:latest


USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y --no-install-recommends openjdk-17-jdk \
 && rm -rf /var/lib/apt/lists/*
WORKDIR /deb-file
COPY . .
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]

EXPOSE 8080
WORKDIR /home/coder/project

# RUN cat /root/.config/code-server/code-server.yml
