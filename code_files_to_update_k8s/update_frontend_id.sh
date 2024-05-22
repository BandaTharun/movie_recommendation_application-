#!/bin/bash

set -x




# Input variable
TAG=$1
IMAGE_NAME="tharun9705/movie_recommendation_applications_repository"
NEW_IMAGE="$IMAGE_NAME:$TAG"

# Clone the repository
git clone https://github.com/BandaTharun/movie_recommendation_application-.git
cd movie_recommendation_application-/k8sfiles

# Update the Kubernetes manifest file with the new Docker image ID
sed -i "s|\(image: tharun9705/movie_recommendation_applications_repository:\).*|\1$NEW_IMAGE|" frontend_k8's.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf movie_recommendation_application-
