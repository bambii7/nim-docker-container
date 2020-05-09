
# Aims

* Return a successful HTTP response
* Connect to Postgres
* Toggle ENV VARs based on environment
* Dockerise Nim

# Building Locally (outside of Docker)

```
export $(grep -v '^#' .env.example | xargs -d '\n')
nimble build
./minimal_nim_container
```

`docker build -t minimal_nim_container .`
`docker run --env-file=.env.example --rm -i -p 8080:80 -p 5432:5432 -t minimal_nim_container`

`docker run --env-file=.env.example --rm -i -t minimal_nim_container sh`


```
gcloud auth configure-docker
```
`docker tag minimal_nim_container gcr.io/concise-mesh-269700/minimal_nim_container`
`docker push gcr.io/concise-mesh-269700/minimal_nim_container`

### Export image to deploy somewhere

docker save -o minimal_nim_container.tar 40d3f6d75b28

docker build -t simple-nim-app .
docker run --rm -p 8080:80 -t simple-nim-app