FROM gliderlabs/alpine:3.3

VOLUME ["/opt/openvpn"]

RUN apk-install openvpn
COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["--config", "/opt/openvpn/server.conf"]
