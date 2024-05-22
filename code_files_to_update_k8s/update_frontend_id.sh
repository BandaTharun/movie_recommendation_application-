#!/bin/bash

set -x

# Input variable
TAG=$1
IMAGE_NAME="tharun9705/movie_recommendation_applications_repository"
NEW_IMAGE="$IMAGE_NAME:$TAG"

# Assuming "mrdir file" and "cd file" are placeholders for specific commands, I've commented them out
# Uncomment and replace with actual commands if needed
 mrdir file
 cd file

# Clone the repository
git clone https://github.com/BandaTharun/movie_recommendation_application-.git /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# Update the image tag in the frontend_k8s.yaml file
sed -i "s|\(image: tharun9705/movie_recommendation_applications_repository:\).*|\1$TAG|" k8sfiles/frontend_k8s.yaml

# Add the modified files
git add k8sfiles/frontend_k8s.yaml

# Commit the changes
git commit -m "Update frontend image to $NEW_IMAGE"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
cd /tmp
rm -rf /tmp/temp_repo


