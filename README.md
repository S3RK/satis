# Satis in docker

## Settings

### SSH
You shoud set ssh to access any repo required authentication put files in `/root/.ssh/`

```
volumes:
  - "~/.ssh/id_rsa:/root/.ssh/id_rsa"
```
### Satis config file

Put file `/satis/satis.json` into container to use it as configuration

### Volume

You should mount volume to `/satis/web` where all packages will be saved


## Web server to access

Use port 80 to access satis UI

## Schedule build

Call URL `/build` of the container.  Use GET parameters to schedule build:

* `package` - parameter for partial satis build
* `force` - basically schedule will not be set in second time before actual build. Use the parameter to force it. Should be `1`

Call will return HTTP code `200` - if build scheduled, `400` - if not
