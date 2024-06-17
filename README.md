# [Devspace image] python based (alpine)
> image tag nameing: docker-3.8 (build from dockerfile), devcontainer-3.8 (build from devcontainer)

## Devspace usage
* start developement
```
devspace dev
```

* cleanup
```
devspace reset pods 
devspace purge
```

## devspace yaml
images.app <--> deployments.app <--> dev.app

1. dev.app.devImage
image

2. dev.app.sync
mapping local path to pod (can mapping multiple path/file, exclude ...)
In current `devspace.yaml`, since the `/app` path was created in Dockerfile so we can directly mapping.

For vscode console,

3. dev.app.ssh.localHostname
Mapping to `pipelines.dev.run`, vscode-remote (app.devspace)
```
    # Open VSCode as soon as we are done
    code --folder-uri vscode-remote://ssh-remote+app.devspace/app
```

Will config local `~/.ssh/config`, for example:
```
# DevSpace Start app.devspace
Host app.devspace
  HostName localhost
  LogLevel error
  Port 10168
  IdentityFile "/home/alan/.devspace/ssh/id_devspace_ecdsa"
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  User devspace
# DevSpace End app.devspace%  
```

To switch to console connection only,

unmark `dev.app.terminal` (you can also markup vscode related setting (see 3.)):
```
    #terminal:
    #  command: ./devspace_start.sh
```
