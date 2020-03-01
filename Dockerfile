FROM nimlang/nim:alpine AS builder
RUN apk update && apk upgrade \
    && apk add --update --no-cache \
    libpq
WORKDIR /build
COPY . .

RUN nimble build -d:release

EXPOSE 80

CMD ["/build/minimal_nim_container"]

# FROM alpine:3.7
# RUN apk update && apk upgrade \
#     && apk add --update --no-cache \
#     libpq
# COPY --from=builder /build/minimal_nim_container /minimal_nim_container
# COPY --from=builder /build/.env.example /.env.example
# RUN export $(grep -v '^#' .env.example | xargs '\n')
# CMD ["/minimal_nim_container"]
# ENTRYPOINT ["bash"]