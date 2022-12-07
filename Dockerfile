FROM alpine:edge

ARG AUUID="c5f7a150-8be3-41e3-88e2-d6847d7a4ba9"
ARG CADDYIndexPage="https://github.com/vinlid/learn1/raw/main/pagefiles/loruki-website-master.zip"
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
