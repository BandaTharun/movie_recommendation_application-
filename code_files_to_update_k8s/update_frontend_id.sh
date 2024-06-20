#!/bin/bash

set -ex

# Input variables
ACR_REGISTRY_NAME="tharun9705/movie_recommendation_applications_repository"
TAG=$1
YourGitHubToken=$2

DEPLOYMENT_FILE_PATH="k8sfiles/k8sfrontend/frontend.yml"
TEMP_REPO="/tmp/temp_repo"

# Ensure /tmp/temp_repo directory is clean
if [ -d "$TEMP_REPO" ]; then
    rm -rf "$TEMP_REPO"
fi

# Clone the repository using the PAT
git clone https://${YourGitHubToken}@github.com/BandaTharun/movie_recommendation_application-.git "$TEMP_REPO"

# Change directory to the cloned repo
cd "$TEMP_REPO"

# Update the Kubernetes manifest if the file exists
if [ -f "$DEPLOYMENT_FILE_PATH" ]; then
    sed -i "s|image:.*|image: $ACR_REGISTRY_NAME:$TAG|g" "$DEPLOYMENT_FILE_PATH"
else
    echo "Error: $DEPLOYMENT_FILE_PATH file not found!"
    exit 1
fi

# Commit the changes
git add "$DEPLOYMENT_FILE_PATH"
git commit -m 'Update Kubernetes manifest'

# Set git user configuration
git config user.name "Your Name"
git config user.email "youremail@example.com"

# Push the changes
git push https://${YourGitHubToken}@github.com/BandaTharun/movie_recommendation_application-.git

# Cleanup
rm -rf "$TEMP_REPO"










