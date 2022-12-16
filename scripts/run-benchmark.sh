#!/bin/sh
set -ue
echo "Running kubestr to enumerate storage provisioners:"
kubestr
echo "Running jobs in fio-jobs.yaml:"
fio --output output.json --output-format json /fio-jobs/fio-jobs.fio
echo "Test finished, listing output files in: $PWD"
ls
touch benchmark-complete
