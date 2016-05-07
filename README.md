## Usage

```bash
    docker create --name openvpn_data -v /my/openvpn_dir:/opt/openvpn busybox
    docker run -d --rm --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN --volumes-from openvpn_data skopciewski/openvpn
```

## Entrypoint

Redirects all params to the `openvpn` command. Workdir is `/opt/openvpn`.

### Default params

```bash
    --config server.conf
```

### Escape to

If you want to execute other command than `openvpn`, run docker container with `escto` as first param:

```bash
    docker run -it --rm --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN --volumes-from openvpn_data skopciewski/openvpn escto sh
```

## Dependencies and requirements

* mount /opt/openvpn with:
  * server.conf - openvpn server config file
  * server certs - cacert.pem, server-cert.pem, server-key_wp.pem, dh.pem
  * ccd dir - with user files
* internally, if in the ccd file is '`push "redirect-gateway"' directive, iptables is configured for forwarding traffic from that client
* server should be configured to use port 1194/udp (remap using `-p 445:1194/udp`)

