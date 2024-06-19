

#!/bin/bash

set -x

# Input variables
ACR_REGISTRY_NAME="tharun9705/movie_recommendation_applications_repository"
TAG=$1
YourGitHubToken=$2

DEPLOYMENT_FILE_PATH="k8sfiles/k8sfrontend/frontend.yml"

# Clone the repository using the PAT
git clone https://${YourGitHubToken}@github.com/BandaTharun/movie_recommendation_application-.git /tmp/temp_repo

# Change directory to the cloned repo
cd /tmp/temp_repo

# Update the Kubernetes manifest
sed -i "s|image:.*|image: $ACR_REGISTRY_NAME:$TAG|g" $DEPLOYMENT_FILE_PATH

# Commit the changes
git add $DEPLOYMENT_FILE_PATH

git commit -m "Update Kubernetes manifest to use image $ACR_REGISTRY_NAME:$TAG"


# Push the changes
git push https://${YourGitHubToken}@github.com/BandaTharun/movie_recommendation_application-.git




