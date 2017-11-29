# radvent

radvent is a simmple advent calendar blog system.

https://github.com/haru/radvent

## Start container with docker command

```
$ docker run -d -p 3000:3000 -v /tmp/data:/usr/local/radvent_data haru/radvent
```

## docker-compose.yml sample

```
version: '2'
services:
  radvent:
    image: haru/radvent:latest
    ports:
      - "3000:3000"
    volumes:
      - "$PWD/data:/usr/local/radvent_data"
```