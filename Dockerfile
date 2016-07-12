FROM gliderlabs/alpine:3.4

RUN apk-install openvpn bash
COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENV OPENVPN_HOME /opt/openvpn
VOLUME ["${OPENVPN_HOME}"]
WORKDIR ${OPENVPN_HOME}
EXPOSE 1194/udp

ENTRYPOINT ["/entrypoint"]
CMD ["--config", "server.conf"]
