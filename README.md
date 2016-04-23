## Usage

```bash
    docker run -d --rm --name openvpn --net=host --privileged skopciewski/openvpn
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
    docker run -it --rm --name openvpn --net=host --privileged skopciewski/openvpn escto sh
```

## Dependencies

* mount /opt/openvpn with:
  * server.conf - openvpn server config file
