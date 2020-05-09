FROM minio/minio:RELEASE.2020-05-08T02-40-49Z

LABEL \
    org.label-schema.name="minio-public-bucket" \
    org.label-schema.description="minio with automatic public bucket" \
    org.label-schema.url="https://github.com/512k/minio-public-bucket-docker" \
    org.label-schema.vcs-url="https://github.com/512k/minio-public-bucket-docker" \
    org.label-schema.license="MIT" \
    org.label-schema.schema-version="1.0"

COPY ./allow-all-policy.json ./docker-entrypoint.sh /opt/

ENTRYPOINT ["/opt/docker-entrypoint.sh"]
CMD ["server", "/data"]
