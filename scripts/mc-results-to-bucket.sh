apiVersion: v1
kind: ConfigMap
metadata:
  name: mc-results-to-bucket
data:
  mc-results-to-bucket.sh: |
    #!/bin/sh
    set -ue
    echo "Setting up mc connection to S3 Bucket:"
    mc -C /config alias set store https://${BUCKET_HOST} ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY} --api S3v4

    echo "Syncing contents of ${PWD}/ to Bucket ${BUCKET_NAME}"
    mc mirror ./ store/${BUCKET_NAME}/${BENCHMARK_NAME}/
    echo Printing contents of Bucket ${BUCKET_NAME}/${BENCHMARK_NAME}
    echo --------------------------------------------
    mc ls store/${BUCKET_NAME}/${BENCHMARK_NAME}/
    echo --------------------------------------------
