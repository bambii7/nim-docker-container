
# Nim Container

A simple set up for building and containerizing Nim for production.

## Build and run

```bash
docker build -t simple-nim-app .
docker run --rm -p 8080:80 -t simple-nim-app
```

## Aim

* Barebones Nim server
* Containerized for deployment
* Return a successful HTTP response
* Connect to Postgres
* Configure Env vars

## Building Locally (outside of Docker)

```bash
export $(grep -v '^#' .env.example | xargs -d '\n')
nimble build
./minimal_nim_container
```

## Building with Docker

```bash
docker build -t minimal_nim_container .
docker run --env-file=.env.example --rm -i -p 8080:80 -p 5432:5432 -t minimal_nim_container
```

### Open up a shell inside the container

```bash
docker run --env-file=.env.example --rm -i -t minimal_nim_container sh
```

## GCP

Deploying to Google Cloud Container Registry

```bash
gcloud auth configure-docker
docker tag minimal_nim_container gcr.io/concise-mesh/minimal_nim_container
docker push gcr.io/concise-mesh/minimal_nim_container
```

### Export image to deploy somewhere

Dump the image

```bash
docker save -o minimal_nim_container.tar 40d3f6d75b28
```
