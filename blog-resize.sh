#!/bin/sh
set -e
set -o pipefail

echo "Resizing .........."
kubectl scale statefulset wordpress --replicas=$1

echo "You will now have $1 baseline."
