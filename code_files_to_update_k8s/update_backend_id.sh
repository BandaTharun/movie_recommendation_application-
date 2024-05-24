#!/bin/bash

set -x


# Input variables
REPO_URL="https://github.com/BandaTharun/movie_recommendation_application-.git"
ACR_REGISTRY_NAME="tharun9705/movie_recommendation_applications_repository"
TAG=$1
YourGitHubToken=$2


DEPLOYMENT_FILE_PATH="k8sfiles/k8sbackend/backend.yml"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# Update the image tag in the specified deployment.yaml file
sed -i "s|image:.*|image: $ACR_REGISTRY_NAME:$TAG|g" $DEPLOYMENT_FILE_PATH

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push 


# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
