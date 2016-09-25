## Usage

```bash
    docker run -d --rm --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN -v /my/openvpn_dir:/mnt/openvpn skopciewski/openvpn
```

## Entrypoint

Redirects all params to the `openvpn` command. Workdir is `/mnt/openvpn`.

### Default params

```bash
    --config server.conf
```

### Escape to

If you want to execute other command than `openvpn`, run docker container with `escto` as first param:

```bash
    docker run -it --rm --name openvpn -p 1194:1194/udp --cap-add=NET_ADMIN -v /my/openvpn_dir:/mnt/openvpn skopciewski/openvpn escto sh
```

## Dependencies and requirements

* mount /mnt/openvpn with:
  * server.conf - openvpn server config file
  * server certs - cacert.pem, server-cert.pem, server-key_wp.pem, dh.pem
  * ccd dir - with user files
* internally, if in the ccd file is `push "redirect-gateway"` directive, iptables is configured for forwarding traffic from that client
* server should be configured to use port 1194/udp (remap using `-p 445:1194/udp`)

