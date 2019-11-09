
# Aims

* Return a successful HTTP response
* Connect to Postgres
* Toggle ENV VARs based on environment
* Extract image to run on AWS Fargate

# Building Locally (outside of Docker)

```
export $(grep -v '^#' .env.example | xargs -d '\n')
nimble build
./minimal_nim_container
```