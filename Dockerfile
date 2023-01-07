FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14

ENV SCOOP_HOME /scoop/apps/scoop/current
ENV SCOOP_DEBUG 1
ENV PATH $PATH:$SCOOP_HOME/bin

RUN apk add --no-cache git p7zip \
    && mkdir -p $SCOOP_HOME \
    && git clone https://github.com/ScoopInstaller/Scoop.git $SCOOP_HOME

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
