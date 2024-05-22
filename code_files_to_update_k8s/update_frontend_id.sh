#!/bin/bash

set -x

# Clone the repository
git clone https://github.com/BandaTharun/movie_recommendation_application-.git


# Navigate into the cloned repository directory
cd movie_recommendation_application-/k8sfiles

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: <ACR-REGISTRY-NAME>/$1:$2|g" frontend_k8's.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf movie_recommendation_application-
