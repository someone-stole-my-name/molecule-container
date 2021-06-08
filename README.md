# Molecule in a box

```
docker run --rm -it -v $(pwd):/role \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --privileged \
    chn2guevara/molecule bash
```
