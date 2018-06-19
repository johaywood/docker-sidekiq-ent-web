# Sidekiq Enterprise Web Dockerfile

Build a Docker image for the Sidekiq Enterprise web interface

## Config
```bash
$ git clone https://github.com/johaywood/docker-sidekiq-ent-web
$ cd docker-sidekiq-ent-web
$ cat > .env <<EOL
  ENT_USERNAME=your_contribsys_username
  ENT_PASSWORD=your_contribsys_password
  REDIS_URL=redis://localhost:6379
  EOL
```

## Build
```bash
$ docker build -t docker-sidekiq-ent-web .
```

## Run
```bash
$ docker run -p 3333:3333 docker-sidekiq-ent-web
```

Visit `localhost:3333` in your browser and _violà_!

## Notes
**DO NOT publish images built with this Dockerfile to a public repo!!**  
You risk exposing your Sidekiq Enterprise credentials and having them revoked!

`ENT_USERNAME` and `ENT_PASSWORD` are required at build time to install the Sidekiq Enterprise gem and must be included in your `.env` file, but if you don't want to define the `REDIS_URL` there or want to override it at runtime, you can use the `-e` flag

```bash
$ docker run -p 3333:3333 -e REDIS_URL=redis://localhost:6379 docker-sidekiq-ent-web
```
