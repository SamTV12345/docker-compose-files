FROM debian:bullseye AS pg-builder
RUN apt-get update
RUN apt-get install --yes libpq5

FROM gcr.io/distroless/cc

### /usr/lib/x86_64-linux-gnu
#COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libpq.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libgssapi_krb5.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libldap_r-2.4.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libkrb5.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libk5crypto.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libkrb5support.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/liblber-2.4.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libsasl2.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libgnutls.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libp11-kit.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libidn2.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libunistring.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libtasn1.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libnettle.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libhogweed.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libgmp.so* /usr/lib/x86_64-linux-gnu/
COPY --from=pg-builder /usr/lib/x86_64-linux-gnu/libffi.so* /usr/lib/x86_64-linux-gnu/

### /lib/x86_64-linux-gnu
#COPY --from=pg-builder /lib/x86_64-linux-gnu/* /lib/x86_64-linux-gnu/
COPY --from=pg-builder /lib/x86_64-linux-gnu/libcom_err.so.2 /lib/x86_64-linux-gnu/libcom_err.so.2
COPY --from=pg-builder /lib/x86_64-linux-gnu/libcom_err.so.2.1 /lib/x86_64-linux-gnu/libcom_err.so.2.1
COPY --from=pg-builder /lib/x86_64-linux-gnu/libkeyutils.so.1 /lib/x86_64-linux-gnu/libkeyutils.so.1
COPY --from=pg-builder /lib/x86_64-linux-gnu/libkeyutils.so.1.9 /lib/x86_64-linux-gnu/libkeyutils.so.1.9