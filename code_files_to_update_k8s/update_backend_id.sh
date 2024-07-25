
#!/bin/bash

set -x

# Input variables
ACR_REGISTRY_NAME="tharun9705/movie_recommendation_applications_repository"
TAG=$1
YourGitHubToken=$2

#DEPLOYMENT_FILE_PATH="k8sfiles/k8sbackend/backend.yml"

DEPLOYMENT_FILE_PATH="helm-backtend-application-chat/values.yaml"

# Clone the repository using the PAT
git clone https://${YourGitHubToken}@github.com/BandaTharun/movie_recommendation_application-.git /tmp/temp_repo

# Change directory to the cloned repo
cd /tmp/temp_repo

# Update the Kubernetes manifest
sed -i "s/tag1:.*/tag1: $TAG/g" "$DEPLOYMENT_FILE_PATH"



#'s/tag: .*/tag: "${{github.run_id}}"/'

# Commit the changes
git add $DEPLOYMENT_FILE_PATH
git commit -m 'Update Kubernetes manifest'

# Set git user configuration
git config user.name "Your Name"
git config user.email "youremail@example.com"

# Push the changes
git push https://${YourGitHubToken}@github.com/BandaTharun/movie_recommendation_application-.git

# Cleanup
rm -rf /tmp/temp_repo

