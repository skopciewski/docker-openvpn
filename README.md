## Usage

```bash
    docker create --name openvpn_data -v /my/openvpn:/opt/openvpn busybox
    docker run -d --rm --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN --volumes-from openvpn_data skopciewski/openvpn
```

## Entrypoint

Redirects all params to the `openvpn` command.

### Default params

```bash
    --config /opt/openvpn/server.conf
```

### Escape to

If you want to execute other command than `openvpn`, run docker container with `escto` as first param:

```bash
    docker run -it --rm --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN --volumes-from openvpn_data skopciewski/openvpn escto sh
```

## Dependencies

* mount /opt/openvpn with:
  * server.conf - openvpn server config file (with deps: cacert.pem, server-cert.pem, server-key_wp.pem, dh.pem, ccd dir)
  * server should be configured to use port 1194/udp (remap using `-p 445:1194/udp` or use `--net=host`)

