#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Variables
BUCKET_NAME="my-arcade-bucket-$(date +%s)"
REGION="us-central1"

echo "Creating bucket: $BUCKET_NAME in $REGION..."
gcloud storage buckets create $BUCKET_NAME --location=$REGION

echo "Creating sample file..."
echo "Hello, Arcade!" > sample.txt

echo "Uploading file to bucket..."
gcloud storage cp sample.txt gs://$BUCKET_NAME/

echo "Listing all buckets..."
gcloud storage buckets list

echo "Listing files in the new bucket..."
gcloud storage ls gs://$BUCKET_NAME/

echo "Setup complete!"
