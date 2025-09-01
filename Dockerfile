FROM alpine:3.22.1
RUN apk add --no-cache unbound

ARG UID=1000
ARG GID=1000
RUN apk add --no-cache shadow && \
    usermod -u ${UID} unbound && \
    groupmod -g ${GID} unbound && \
    apk del shadow

COPY unbound.conf /etc/unbound

VOLUME ["/etc/unbound/unbound.conf.d"]
EXPOSE 5353/udp 5353/tcp
USER unbound
CMD ["unbound", "-d"]
