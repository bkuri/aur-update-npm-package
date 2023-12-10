#!/bin/bash

ACCESS_TOKEN="your_personal_access_token"
REPO_OWNER="bkuri"

if [ ! -f PKGBUILD ]; then
  echo "Error: PKGBUILD file not found."
  exit 1
fi

source PKGBUILD

# Build and package the software
makepkg -si || { echo "Error: Failed to build and install the package."; exit 1; }

# Create a release
curl -X POST \
  -H "Authorization: token ${ACCESS_TOKEN}" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/${REPO_OWNER}/${pkgname}/releases \
  -d '{"tag_name": "'"${pkgver}"'","name": "'"${pkgver}"'"}'
