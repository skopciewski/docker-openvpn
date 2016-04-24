FROM gliderlabs/alpine:3.3

VOLUME ["/opt/openvpn"]

RUN apk-install openvpn bash
COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

EXPOSE 1194/udp
WORKDIR /opt/openvpn
ENTRYPOINT ["/entrypoint"]
CMD ["--config", "/opt/openvpn/server.conf"]
