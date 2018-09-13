#!/bin/sh
#set -e
#set -o pipefail

read -p "Please enter blog cluster name you want to delete: " cluster_name

kubectl delete service mysql wordpress
kubectl delete statefulset mysql wordpress
kubectl delete secret mysql

gcloud container clusters delete $cluster_name
