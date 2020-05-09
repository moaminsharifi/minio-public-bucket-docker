<p align="center">
 <img src="https://hsto.org/webt/tn/7z/vw/tn7zvwq4bjhc-ziij1107jdqxlq.png" width="90" alt="logo">
</p>

# [minio][link_minio] with automatic public bucket

[![Build][badge_automated]][link_hub]
[![Build][badge_build]][link_hub]
[![Test Status][badge_test]][link_test]
[![Docker Pulls][badge_pulls]][link_hub]
[![Issues][badge_issues]][link_issues]
[![License][badge_license]][link_license]

### What is this?

Docker image with [minio][link_minio] that can create bucket on image startup with full public access permissions.

## Supported tags

Tag name | Details               | Full image name                   | Dockerfile
:------: | :-------------------: | :-------------------------------: | :-----------------------:
`latest` | ![Size][badge_latest] | `512k/minio-public-bucket:latest` | [link][dockerfile_latest]

[badge_latest]:https://img.shields.io/docker/image-size/512k/minio-public-bucket/latest
[dockerfile_latest]:./latest/Dockerfile

## Allowed environment variables

All environment variables from [official image][link_minio_hub] are allowed. Additionally, you can use:

Name                 | Description
-------------------- | ---------------------------------------------------------
`PUBLIC_BUCKET_NAME` | Public bucket name _(special characters must be escaped)_

## Usage examples

`docker run` sample:

```shell script
$ docker run -it -p 9000:9000/tcp \
    -e "MINIO_ACCESS_KEY=access_key" \
    -e "MINIO_SECRET_KEY=secret_key" \
    -e "PUBLIC_BUCKET_NAME=my_public_bucket" \
    512k/minio-public-bucket
```

Docker-compose sample:

```yaml
version: '3.4'

volumes:
  minio-data:

services:
  minio:
    image: 512k/minio-public-bucket:latest
    environment:
      MINIO_ACCESS_KEY: access_key
      MINIO_SECRET_KEY: secret_key
      PUBLIC_BUCKET_NAME: my_public_bucket
    ports:
      - 9000:9000/tcp
    volumes:
      - minio-data:/data:cached
```

### Releasing

New versions publishing is very simple - just update dockerfile(s) file and "publish" new release using repo releases page.

> Release version _(and git tag, of course)_ MUST starts with `v` prefix (eg.: `v0.0.1` or `v1.2.3-RC1`).
>
> All provided docker tags will be overwritten. New tags appending requires build configuration on [hub.docker.com](https://hub.docker.com) side.

### License

MIT. Use anywhere for your pleasure.

[badge_automated]:https://img.shields.io/docker/cloud/automated/512k/minio-public-bucket.svg?style=flat-square&maxAge=30
[badge_pulls]:https://img.shields.io/docker/pulls/512k/minio-public-bucket.svg?style=flat-square&maxAge=30
[badge_issues]:https://img.shields.io/github/issues/512k/minio-public-bucket-docker.svg?style=flat-square&maxAge=30
[badge_build]:https://img.shields.io/docker/cloud/build/512k/minio-public-bucket.svg?style=flat-square&maxAge=30
[badge_license]:https://img.shields.io/github/license/512k/minio-public-bucket-docker.svg?style=flat-square&maxAge=30
[badge_test]:https://img.shields.io/github/workflow/status/512k/minio-public-bucket-docker/test?maxAge=30&logo=github&style=flat-square&label=test
[link_test]:https://github.com/512k/minio-public-bucket-docker/actions
[link_hub]:https://hub.docker.com/r/512k/minio-public-bucket/
[link_license]:https://github.com/512k/minio-public-bucket-docker/blob/master/LICENSE
[link_issues]:https://github.com/512k/minio-public-bucket-docker/issues
[link_minio]:https://github.com/minio/minio
[link_minio_hub]:https://hub.docker.com/r/minio/minio
[rabbitmq_delayed_message_exchange]:https://github.com/rabbitmq/rabbitmq-delayed-message-exchange
