#!/bin/sh

set -ue
echo "Setting up mc connection to S3 Bucket:"
mc -C /config alias set store "https://${BUCKET_HOST}" "${AWS_ACCESS_KEY_ID}" "${AWS_SECRET_ACCESS_KEY}" --api S3v4

for benchmark_name in disk pv; do
	echo "Syncing contents of bucket ${BUCKET_NAME} to ${PWD}/$benchmark_name"
	mkdir -p "$benchmark_name"
	while :; do
		mc -C /config mirror "store/${BUCKET_NAME}/${benchmark_name}/" ./$benchmark_name || :
		[ -f "$benchmark_name/benchmark-complete" ] && break
		echo "waiting to retry"
		sleep 5
	done
done
