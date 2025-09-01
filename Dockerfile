FROM alpine:3.22.1
RUN apk add --no-cache unbound

ARG UID=1000
ARG GID=1000
RUN deluser unbound && \
    addgroup -g ${GID} unbound && \
    adduser -D -u ${UID} -G unbound -s /sbin/nologin unbound

VOLUME ["/etc/unbound"]
EXPOSE 5353/udp 5353/tcp
USER unbound
CMD ["unbound", "-d"]
