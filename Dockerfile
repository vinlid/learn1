FROM alpine:edge

ARG AUUID="513ff9e8-b9ad-4cbd-9de9-597ae7a6bdaf"
ARG CADDYIndexPage="https://github.com/vinlid/learn1/raw/main/pagefiles/Spotify-Landing-Page-Redesign-master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/vinlid/learn1/raw/main/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
