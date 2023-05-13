# docker buildx build --platform linux/amd64 --platform linux/arm/v7 --platform linux/arm64/v8 -t samuel19982/rust-builder --push . 

FROM alpine:3.17

RUN apk add --no-cache \
        ca-certificates \
        gcc

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.68.2

RUN apk add rust

RUN apk add cargo