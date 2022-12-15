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

    echo "Syncing contents of ${pwd}/ to Bucket ${BUCKET_NAME}"
    mc -C /config mirror ${pwd}/ store/${BUCKET}/${pwd}/
    echo Printing contents of Bucket ${BUCKET}/${pwd}
    echo --------------------------------------------
    mc -C /config ls store/${BUCKET}/${pwd}/
    echo --------------------------------------------
