#!/bin/sh
set -ue
echo "Setting up mc connection to S3 Bucket:"
mc -C /config alias set store "https://${BUCKET_HOST}" "${AWS_ACCESS_KEY_ID}" "${AWS_SECRET_ACCESS_KEY}" --api S3v4

while ! [ -f benchmark-complete ]; do
    echo "waiting for benchmark to complete"
    sleep 1
done

echo "Syncing contents of ${PWD} to Bucket ${BUCKET_NAME}"
mc -C /config mirror . "store/${BUCKET_NAME}/${BENCHMARK_NAME}/"
echo "Contents of Bucket ${BUCKET_NAME}/${BENCHMARK_NAME}"
echo --------------------------------------------
mc -C /config ls "store/${BUCKET_NAME}/${BENCHMARK_NAME}/"
echo --------------------------------------------
