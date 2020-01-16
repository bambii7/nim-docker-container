
# Aims

* Return a successful HTTP response
* Connect to Postgres
* Toggle ENV VARs based on environment
* Dockerise Nim
* Extract image to run on AWS Fargate

# Building Locally (outside of Docker)

```
export $(grep -v '^#' .env.example | xargs -d '\n')
nimble build
./minimal_nim_container
```

`docker build -t minimal_nim_container .`
`docker run --env-file=.env.example --rm -i -p 8080:8080 -p 5432:5432 -t minimal_nim_container`

`docker run --env-file=.env.example --rm -i -t minimal_nim_container sh`

### Export image to deploy somewhere

docker save -o minimal_nim_container.tar 40d3f6d75b28