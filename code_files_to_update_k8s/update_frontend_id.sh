#!/bin/bash

set -x

# Input variable
TAG=$1
IMAGE_NAME="tharun9705/movie_recommendation_applications_repository"
NEW_IMAGE="$IMAGE_NAME:$TAG"

# Clone the repository
git clone https://github.com/BandaTharun/movie_recommendation_application-.git

# Navigate into the cloned repository directory
cd movie_recommendation_application-/k8sfiles

# Make changes to the Kubernetes manifest file(s)
# Update the image tag in the frontend_k8's.yaml file
sed -i "s|\(image: tharun9705/movie_recommendation_applications_repository:\).*|\1$TAG|" frontend_k8's.yaml

# Add the modified files
git add frontend_k8's.yaml

# Commit the changes
git commit -m "Update frontend image to $NEW_IMAGE"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
cd ../../
rm -rf movie_recommendation_application-
