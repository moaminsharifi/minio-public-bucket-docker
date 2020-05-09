#!/usr/bin/env sh
set -e

PUBLIC_BUCKET_NAME="${PUBLIC_BUCKET_NAME:-}";

if [ -n "$PUBLIC_BUCKET_NAME" ]; then
  echo "$0: create directories for bucket and policy '$PUBLIC_BUCKET_NAME'";
  mkdir -p "/data/$PUBLIC_BUCKET_NAME" "/data/.minio.sys/buckets/$PUBLIC_BUCKET_NAME";

  echo "$0: create policy for bucket '$PUBLIC_BUCKET_NAME'";
  target_policy="/data/.minio.sys/buckets/$PUBLIC_BUCKET_NAME/policy.json";
  cp -f /opt/allow-all-policy.json "$target_policy";

  sed -i "s|{#PUBLIC_BUCKET_NAME#}|$PUBLIC_BUCKET_NAME|g" "$target_policy";
fi;

# return control to the original file
/bin/sh /usr/bin/docker-entrypoint.sh "$@"
