#!/bin/sh

set -e
set -o pipefail

if [[ $1 -eq "" ]]; then
    echo "Please provide the Google Cloud Key json file"
    echo "Example:"
    echo "./blog-up.sh project-1224234.json"
    exit 0
fi

gcloud auth activate-service-account --key-file=$1
gcloud config set compute/zone asia-east1-a

echo "Welcome........"

read -p "Please enter cluster name: " cluster_name

echo "Please enter mysql password"
read -s mysql_pass

echo "Creating the blog.............."

gcloud container clusters create $cluster_name
kubectl create secret generic mysql --from-literal=password=$mysql_pass

kubectl apply -f mysql.yaml
kubectl apply -f mysql-service.yaml

kubectl apply -f wordpress.yaml
kubectl apply -f wordpress-service.yaml

ip_pub=$(kubectl get service wordpress --no-headers | awk {'print $4'})

while [[ $ip_pub = "<pending>" ]]
do
    ip_pub=$(kubectl get service wordpress --no-headers | awk {'print $4'})
done


echo "Done. Your blog is ready at http://$ip_pub"
